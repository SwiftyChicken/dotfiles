#!/bin/sh

## ORIGINAL SOURCE: 
# https://github.com/konapun/dotfiles/blob/master/zsh/custom/greet.zsh

columns=$(tput cols)
[[ $columns -le 70 ]] && exit 0

RED='\033[1;31m'
WHITE='\033[1;37m'
TITLE='\033[0;37m'
BOLD=$(tput bold)
RESET=$(tput sgr0)
 
  echo -e "  ${TITLE}${BOLD}              人  工  知  能  や  ロ  ボ  ッ  ト  エ  学                   ${RESET}"
  echo -e "     ${RED}####    ####       ###     ####      #### ####    #####      ###"
  echo -e "     ${RED}####    ####      #####    #####     #### ####   #####      #####"
  echo -e "     ${RED}####    ####     #######   ######    #### #### #####       #######"
  echo -e "     ${RED}############    #### ####  #######   #### #########       #### ####"
  echo -e "     ${RED}############   ####   #### ########  #### ##########     ####   ####"
  echo -e "     ${RED}####    ####  ####     ######## #### #### ##### #####   ####     ####"
  echo -e "     ${RED}####    #### ####       #######  ######## ####   ##### ####       ####"
  echo -e "     ${RED}####    ########         ######   ####### ####    ########         ####"
  echo -e "  ${TITLE}${BOLD}       R       O       B       O       T       I       C       S            ${RESET}"
  echo ""
exit 0
