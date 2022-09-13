---
title: "A MediaWiki CAS Setup with SimpleSAMLphp"
date: 2022-09-13
type: "post"
authors: ["nyby"]
tags: ["mediawiki", "authentication", "php", "sysadmin"]
lede: ""
shortlede: ""
poster: ""
thumbnail: ""
socmediaimg: ""
hiliteimg: ""
poster_sourceurl: ""
poster_source: ""
bookendanimal: ""
---

I want to illustrate how to configure MediaWiki to authenticate with a
central auth server using CAS. The CTL wiki has long been overdue for
the change to [Single Sign-on](https://en.wikipedia.org/wiki/Single_sign-on).

I'm going to focus on how to get things working with CAS, but if you
want to use a different identity provider, you can not only use any
auth method [PluggableAuth](https://www.mediawiki.org/wiki/Extension:PluggableAuth)
supports, but also
[any of SimpleSAML's modules](https://simplesamlphp.org/docs/contributed_modules.html) -
many of these are included with SimpleSAML itself and are
well-supported.

[SimpleSAMLphp](https://simplesamlphp.org/) is an amazing project that's been around for a long
time, is very stable, and has a large user community with lots of
support and documentation. It's one of those projects that's so
flexible that it takes some time to learn how to use it, what it can
do, and how it works.


# SimpleSAML configuration

I'm using nginx here, and you'll need to add a nested location clause
in your wiki's server configuration, to make the /simplesaml/ path
accessible. The goal here is to be able to access the endpoint at
https://yourwiki.edu/simplesaml/ in your browser - SimpleSAML provides
a web app interface here that will help you configure
it. Additionally, this is required to be in place as a basic piece of
how the authentication process works with SimpleSAML. After verifying
a user's identity with the identity provider (a remote CAS server),
the browser is redirected to the SimpleSAML application here, which
then passes control over to your wiki via the mediawiki extension.

In `/etc/nginx/sites-available/wiki.conf`:

```
server {
    # ...

    location ^~ /simplesaml {
        alias /usr/share/simplesamlphp/www;

        location ~ \.php(/|$) {
            include fastcgi_params;
            fastcgi_pass unix:/run/php/php7.4-fpm.sock;
            fastcgi_param SCRIPT_FILENAME $request_filename;
            fastcgi_split_path_info ^(.+?\.php)(/.*)$;
            fastcgi_param PATH_INFO $fastcgi_path_info;
            fastcgi_index index.php;
        }
    }
    # ...
}
```

Now the actual SimpleSAML configuration, in
`/etc/simplesamlphp/config.php` and
`/etc/simplesamlphp/authsources.php`. Notes for `config.php`:

* baseurlpath is the web path pointing to your SimpleSAML instance, e.g.: https://yourwiki.edu/simplesaml/
* I changed store.type to memcache - I ran into a problem using phpsession.
* Enable the cas module in the modules section - see https://simplesamlphp.org/docs/stable/simplesamlphp-install.html#enabling-and-disabling-modules

Now you'll configure the connection to your CAS server.

`authsources.php`:

```
'my-cas' => [
    'cas:CAS',
    'cas' => [
        'login' => 'https://mycas.example.edu/cas/login',
        'serviceValidate' => 'https://mycas.example.edu/cas/p3/serviceValidate',
        'logout' => 'https://mycas.example.edu/cas/logout',
        'name' => [
            'en' => 'My Wiki',
        ],
        'attributes' => [
            'username' => '/cas:serviceResponse/cas:authenticationSuccess/cas:user',
            'givenName' => '/cas:serviceResponse/cas:authenticationSuccess/cas:attributes/cas:givenName',
            'lastName' => '/cas:serviceResponse/cas:authenticationSuccess/cas:attributes/cas:lastName',
            'mail' => '/cas:serviceResponse/cas:authenticationSuccess/cas:attributes/cas:mail',
        ],
    ],
    // I'm not using ldap - CAS v3 should contain
    // all the info I need
    'ldap' => [],
],
```

Sometimes it can help to see all the CAS data available to you when
configuring something like this. To do this, you can debug the
SimpleSAML's CAS module and print out the results from the CAS
server. You can add a few lines to the casServiceValidate() function,
after $result is fetched from the identity provider:

```
ob_start();
var_dump($result):
error_log(ob_get_clean(), 3, '/tmp/cas.log');
```

Then tail `cas.log` while making an auth attempt. Configure your
attributes in `authsources.php` as needed.

# MediaWiki configuration

Download the [PluggableAuth](https://www.mediawiki.org/wiki/Extension:PluggableAuth) and
[SimpleSAMLphp](https://www.mediawiki.org/wiki/Extension:SimpleSAMLphp) extensions,
and unzip those into your
extensions directory. You'll also want to install SimpleSAMLphp -
either through your operating system or from their site.

You'll need to specify in MediaWiki's LocalSettings file where it's
installed - usually it's something like /usr/share/simplesamlphp or
/var/simplesamlphp.

```
$wgSimpleSAMLphp_InstallDir = '/usr/share/simplesamlphp';
$wgSimpleSAMLphp_AuthSourceId = 'my-cas';
$wgSimpleSAMLphp_UsernameAttribute = 'username';
$wgSimpleSAMLphp_RealNameAttribute = ['givenName', 'lastName'];
$wgSimpleSAMLphp_EmailAttribute = 'mail';
$wgPluggableAuth_ButtonLabel = 'Log in with CAS';

wfLoadExtension( 'PluggableAuth' );
wfLoadExtension( 'SimpleSAMLphp' );
```

Note that the exact syntax of these config options have changed with
PluggableAuth 6.0, but you can sort out those differences if that's
what you're using. I'm using 5.7 because I'm on the LTS release of
MediaWiki (1.35.x).

With all these steps in place, the auth process should basically be
working. But then, what happens on a successful auth? Is a user
created in MediaWiki? The simplest path is just to use the same
username you got from the CAS server, and set up MediaWiki to allow
accounts to be created automatically via the autocreateaccount
permission. In fact, PluggableAuth's installation steps state: "The
createaccount or autocreateaccount user rights must be granted to all
users." That's not necessarily true, and I'll cover that in the next
section.

# User association

Auto-creation of accounts is certainly one path forward. In my case,
we needed a more nuanced approach: we have 40 or so wiki users with no
real username standard, though it's usually either firstname, or first
initial + last name. These users should all have emails associated
with them as well. I'll use that to associate the user with the email
we get from CAS. In addition, we don't want users to be able to create
accounts themselves just by authenticating through CAS. We have a
private wiki and opt for a more manual approach - We create users
ourselves when needed.

You can override the SimpleSAML username using its
[MandatoryUserInfoProvider](https://github.com/wikimedia/mediawiki-extensions-SimpleSAMLphp#define-custom-user-info-provider) functionality. In fact, you can even do some
queries to the user database during this step if CAS does provide some
info that can be helpful in finding your wiki user. In our case, the
email from CAS will likely match the wiki user's email. Still, that's
not always the case, so it's only provided as a fallback method. My
username mapper first checks a hardcoded list of cas users and wiki
users that we know about.

```
// Associate a CAS user with a wiki user
$wgSimpleSAMLphp_MandatoryUserInfoProviderFactories['username'] = function($config) {
    return new \MediaWiki\Extension\SimpleSAMLphp\UserInfoProvider\GenericCallback(
        function($attributes) {
            $usernameMap = [
                'casUsername1' => 'wikiUser1',
                'casUsername2' => 'wikiUser2',
                // etc.
            ];

            $uni = $attributes['username'][0];

            // If the cas user is in our hardcoded array, just use that username
            if (array_key_exists($uni, $usernameMap)) {
                return $usernameMap[$uni];
            }

            $emails = [$uni . '@example.edu'];
            if (!empty($attributes['mail'])) {
                array_push($emails, $attributes['mail'][0]);
            }

            $dbr = wfGetDB(DB_REPLICA);
            $id = $dbr->selectField(
                'user',
                'user_id', [
                    'user_email' => $emails
                ]
            );

            if ($id) {
                $user = User::newFromId($id);
            } else {
                // If we didn't find a user, just return the uni
                return $uni;
            }

            if ($user) {
                // If there's a MediaWiki user, return its username
                $username = $user->getName();
            } else {
                $username = $uni;
            }

            return $username;
        }
    );
};
```