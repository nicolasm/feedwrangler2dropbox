#!/bin/bash -
# Get path to Dropbox.
DROPBOXPATH=$(cat "/Users/$USER/.dropbox/host.db" | head -2 | tail -1 | base64 -D)

JSONFEEDS=FeedWrangler_Feeds_$(date +%Y%m%d_%H%M%S).json
JSONSTREAMS=FeedWrangler_SmartStreams_$(date +%Y%m%d_%H%M%S).json

# Get Feed Wrangler access token from .netrc.
NETRC=($(/Users/$USER/Library/Scripts/Applications/get_netrc.py "feedwrangler.net"))
ACCESS_TOKEN=${NETRC[1]}

cd ~/Library/

curl "https://feedwrangler.net/api/v2/subscriptions/list?access_token=$ACCESS_TOKEN" | python -mjson.tool > /tmp/${JSONFEEDS}
curl "https://feedwrangler.net/api/v2/streams/list?access_token=$ACCESS_TOKEN" | python -mjson.tool > /tmp/${JSONSTREAMS}

./Scripts/Applications/openssl_encrypt.sh /tmp/${JSONFEEDS} ${DROPBOXPATH}/Private/Backups/FeedWrangler/${JSONFEEDS}.enc
./Scripts/Applications/openssl_encrypt.sh /tmp/${JSONSTREAMS} ${DROPBOXPATH}/Private/Backups/FeedWrangler/${JSONSTREAMS}.enc

rm -f /tmp/${JSONFEEDS}
rm -f /tmp/${JSONSTREAMS}