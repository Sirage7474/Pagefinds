#!/data/data/com.termux/files/usr/bin/bash

clear

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m'

trap ctrl_c INT

function slowprint() {
  text="$1"
  for ((i=0; i<${#text}; i++)); do
    printf "${BLUE}%s${NC}" "${text:$i:1}"
    sleep 0.05
  done
  echo
}

function ctrl_c() {
  echo -e "\n"
  slowprint "Thanks for using Page by sirage7474"
  [ -n "$username" ] && echo -e "\nFile saved: ${username}.txt"
  exit 0
}

echo -e "${RED}"
echo "██████╗  █████╗  ██████╗ ███████╗"
echo "██╔══██╗██╔══██╗██╔════╝ ██╔════╝"
echo "██████╔╝███████║██║  ███╗█████╗  "
echo "██╔═══╝ ██╔══██║██║   ██║██╔══╝  "
echo "██║     ██║  ██║╚██████╔╝███████╗"
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝"
echo -e "${CYAN}
Username OSINT Tool${NC}\n""${GREEN}Version v1 by Sirage7474${NC}\n"

read -p "Enter a username to search: " username
echo -e "\nSearching for: ${BLUE}$username${NC}\n"

filename="${username}.txt"
> "$filename"

# 104 sites in totaal
sites=(
  "GitHub|https://github.com/$username"
  "Twitter|https://twitter.com/$username"
  "Instagram|https://instagram.com/$username"
  "Reddit|https://www.reddit.com/user/$username"
  "Pinterest|https://www.pinterest.com/$username"
  "Facebook|https://www.facebook.com/$username"
  "TikTok|https://www.tiktok.com/@$username"
  "LinkedIn|https://www.linkedin.com/in/$username"
  "YouTube|https://www.youtube.com/$username"
  "Twitch|https://www.twitch.tv/$username"
  "SoundCloud|https://soundcloud.com/$username"
  "Vimeo|https://vimeo.com/$username"
  "Flickr|https://www.flickr.com/people/$username"
  "Steam|https://steamcommunity.com/id/$username"
  "Origin|https://my.origin.com/profile/$username"
  "Roblox|https://www.roblox.com/user.aspx?username=$username"
  "GitLab|https://gitlab.com/$username"
  "DeviantArt|https://$username.deviantart.com"
  "Medium|https://medium.com/@$username"
  "About.me|https://about.me/$username"
  "Replit|https://replit.com/@$username"
  "BuyMeACoffee|https://www.buymeacoffee.com/$username"
  "ProductHunt|https://www.producthunt.com/@$username"
  "Kaggle|https://www.kaggle.com/$username"
  "HackerRank|https://www.hackerrank.com/$username"
  "CodePen|https://codepen.io/$username"
  "Behance|https://www.behance.net/$username"
  "Dribbble|https://dribbble.com/$username"
  "500px|https://500px.com/$username"
  "PayPal|https://www.paypal.me/$username"
  "CashApp|https://cash.app/$username"
  "Venmo|https://venmo.com/$username"
  "Keybase|https://keybase.io/$username"
  "IFTTT|https://ifttt.com/p/$username"
  "Foursquare|https://foursquare.com/$username"
  "Letterboxd|https://letterboxd.com/$username"
  "Badoo|https://badoo.com/en/$username"
  "Canva|https://www.canva.com/$username"
  "Duolingo|https://www.duolingo.com/profile/$username"
  "Codecademy|https://www.codecademy.com/profiles/$username"
  "MyAnimeList|https://myanimelist.net/profile/$username"
  "Trello|https://trello.com/$username"
  "Notion|https://$username.notion.site"
  "Spotify|https://open.spotify.com/user/$username"
  "Snapchat|https://www.snapchat.com/add/$username"
  "Pornhub|https://www.pornhub.com/users/$username"
  "XVideos|https://www.xvideos.com/profiles/$username"
  "XHamster|https://xhamster.com/users/$username"
  "Chess|https://www.chess.com/member/$username"
  "Telegram|https://t.me/$username"
  "Quora|https://www.quora.com/profile/$username"
  "StackOverflow|https://stackoverflow.com/users/$username"
  "Redbubble|https://www.redbubble.com/people/$username"
  "Etsy|https://www.etsy.com/shop/$username"
  "Tumblr|https://$username.tumblr.com"
  "WeHeartIt|https://weheartit.com/$username"
  "LiveJournal|https://$username.livejournal.com"
  "Myspace|https://myspace.com/$username"
  "Gmail|https://mail.google.com/mail/u/0/?pli=1#inbox/$username"
  "Yahoo|https://login.yahoo.com/account/$username"
  "Zoho|https://$username.zoho.com"
  "Bing|https://www.bing.com/profile/$username"
  "Salesforce|https://$username.salesforce.com"
  "Square|https://squareup.com/$username"
  "Dropbox|https://www.dropbox.com/$username"
  "Mailchimp|https://mailchimp.com/$username"
  "Wix|https://$username.wixsite.com"
  "Weebly|https://$username.weebly.com"
  "Squarespace|https://$username.squarespace.com"
  "WordPress|https://$username.wordpress.com"
  "BigCartel|https://$username.bigcartel.com"
  "Airtable|https://airtable.com/$username"
  "Mix|https://mix.com/$username"
  "Figma|https://www.figma.com/@$username"
  "Microsoft|https://$username.microsoft.com"
  "Apple|https://www.apple.com/$username"
  "GitHub Gists|https://gist.github.com/$username"
  "Codeberg|https://codeberg.org/$username"
  "Dev.to|https://dev.to/$username"
  "Lemmy|https://lemmy.world/u/$username"
  "Pixiv|https://www.pixiv.net/en/users/$username"
  "Unsplash|https://unsplash.com/@$username"
  "Instructables|https://www.instructables.com/member/$username"
  "Hackaday|https://hackaday.io/$username"
  "OpenStreetMap|https://www.openstreetmap.org/user/$username"
  "Tinkercad|https://www.tinkercad.com/users/$username"
  "Patreon|https://www.patreon.com/$username"
  "BuySellAds|https://www.buysellads.com/profile/$username"
  "AngelList|https://angel.co/u/$username"
  "Bandcamp|https://$username.bandcamp.com"
  "Archive.org|https://archive.org/details/@$username"
  "Slideshare|https://www.slideshare.net/$username"
  "Scribd|https://www.scribd.com/$username"
  "Goodreads|https://www.goodreads.com/$username"
  "TripAdvisor|https://www.tripadvisor.com/members/$username"
)

total=${#sites[@]}
found=0

for entry in "${sites[@]}"; do
  sitename=$(echo "$entry" | cut -d"|" -f1)
  url=$(echo "$entry" | cut -d"|" -f2)
  code=$(curl -s -o /dev/null -w "%{http_code}" "$url")

  if [ "$code" == "200" ]; then
    echo -e "${GREEN}[$sitename FOUND]${NC} $url"
    echo "[$sitename] $url" >> "$filename"
    ((found++))
  elif [ "$code" == "301" ]; then
    echo -e "${CYAN}[$sitename REDIRECTED]${NC} $url"
  else
    echo -e "${RED}[$sitename NOT FOUND]${NC} $url"
  fi
  sleep 0.5  # Add delay to prevent overloading the servers
done

echo -e "\n${CYAN}Scan complete.${NC}"
echo -e "${GREEN}Found on $found out of $total sites.${NC}"
slowprint "Thanks for using Page by sirage7474"
echo -e "${CYAN}File saved: ${filename}${NC}"
