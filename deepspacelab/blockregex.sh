#!/bin/bash
#Websites to block from regex filter

pihole --regex '(^|\.)Hulu\.com$' '(^|\.)Netflix\.com$' '(^|\.)disneyplus\.com$' '(^|\.)primevideo\.com$' '(^|\.)roblox\.com$'
