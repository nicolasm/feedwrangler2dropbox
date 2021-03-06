#!/bin/bash -
JSONFEEDS=FeedWrangler_Feeds_$(date +%Y%m%d_%H%M%S).json
JSONSTREAMS=FeedWrangler_SmartStreams_$(date +%Y%m%d_%H%M%S).json

# Get Feed Wrangler access token from .netrc.
NETRC=($(/Users/$USER/Library/Scripts/Applications/get_netrc.py "feedwrangler.net"))
ACCESS_TOKEN=${NETRC[1]}

curl "https://feedwrangler.net/api/v2/subscriptions/list?access_token=$ACCESS_TOKEN" | python -mjson.tool > /tmp/${JSONFEEDS}
curl "https://feedwrangler.net/api/v2/streams/list?access_token=$ACCESS_TOKEN" | python -mjson.tool > /tmp/${JSONSTREAMS}

mv /tmp/${JSONFEEDS} ~/"SpiderOak Hive"/Backups/FeedWrangler/
mv /tmp/${JSONSTREAMS} ~/"SpiderOak Hive"/Backups/FeedWrangler/