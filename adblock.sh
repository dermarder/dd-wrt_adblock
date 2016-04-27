#!/bin/sh 
wget -O - https://raw.githubusercontent.com/disconnectme/disconnect/b27abbf033c6f80f157fe9d98cb767c87065fbf4/firefox/content/disconnect.safariextension/opera/chrome/scripts/data.js >> /tmp/adblock.txt
wget -O - https://easylist-downloads.adblockplus.org/easylist.txt >> /tmp/adblock.txt
wget -O - https://easylist-downloads.adblockplus.org/easyprivacy.txt >> /tmp/adblock.txt
wget -O - https://easylist-downloads.adblockplus.org/antiadblockfilters.txt >> /tmp/adblock.txt
wget -O - https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt >> /tmp/adblock.txt
wget -O - https://easylist-downloads.adblockplus.org/fanboy-social.txt >> /tmp/adblock.txt
wget -O - http://winhelp2002.mvps.org/hosts.txt >> /tmp/adblock.txt
wget -O - http://dd-wrt.gmlblog.de/hosts0 >> /tmp/adblock
wget -O - http://hosts-file.net/ad_servers.asp >> /tmp/adblock.txt
wget -O - http://someonewhocares.org/hosts/hosts >> /tmp/adblock.txt
wget -O - https://easylist-downloads.adblockplus.org/malwaredomains_full.txt >> /tmp/adblock.txt
sed -e 's/\r//' -e '/^0.0.0.0/!d' -e '/localhost/d' -e 's/0.0.0.0/0.0.0.0/' -e 's/ \+/\t/' -e 's/#.*$//' -e 's/[ \t]*$//' < /tmp/adblock.txt | sort -u > /tmp/adblock2
cp /tmp/adblock2 /tmp/hosts
rm -rf /tmp/adblock2
rm -rf /tmp/adblock.txt
killall dnsmasq
