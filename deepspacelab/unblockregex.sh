#!/bin/bash
#Websites to unblock from regex filter

pihole -b -d --regex '(^|\.)Hulu\.com$' '(^|\.)Netflix\.com$' '(^|\.)disneyplus\.com$' '(^|\.)primevideo\.com$' '(^|\.)roblox\.com$'
