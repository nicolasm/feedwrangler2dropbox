feedwrangler2dropbox
====================

Create an encrypted backup of your Feed Wrangler feeds and smart streams to Dropbox.

## How does it work?

* Retrieves path to Dropbox.
* Retrieves Feed Wrangler access token from .netrc.
* Retrieves json file with bookmarks.
* Encrypts json file to Dropbox.

## How to install?

* Execute deploy.sh (copies script to "~/Library/Scripts/Applications/FeedWrangler/").
* Get the common-scripts repository and execute deploy.sh.

## How to setup?

* Add a feedwrangler.net entry with your api token to your .netrc in your home folder.
```
machine feedwrangler.net
        login email
        password accesstoken
```

The login won't be used as you need only the access token to use the API.

In order to get an access token:
    * [Create][0] a client key.
    * [Get][1] an access token.

* Create a .backup folder in your home.
* Write your passphrase in a .passphrase.txt file inside that folder.
* Cron the backup_feeds_and_smart_streams.sh script.
* I use a Hazel rule that clean old backups.

## Requirements

* Python
* Dropbox
* Feed Wrangler account

[0]: https://feedwrangler.net/developers/clients
[1]: https://feedwrangler.net/developers/users