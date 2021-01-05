#!/bin/sh

URL="https://www.reddit.com/message/unread/.json?feed=4ed51cfc8ed7cbebb207fb26c64a4448f67a65ea&user=K547NK
"
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/K547NK"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo "#1 $notifications"
else
    echo "#2"
fi
