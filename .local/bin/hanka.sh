#!/bin/sh

## ORIGINAL SOURCE: 
# https://github.com/konapun/dotfiles/blob/master/zsh/custom/greet.zsh

columns=$(tput cols)
[[ $columns -le 70 ]] && exit 0

RED='\033[0;31m'
WHITE='\033[1;37m'
 
  echo -e "     ${WHITE}              人  工  知  能  や  ロ  ボ  ッ  ト  エ  学              "
  echo -e "     ${RED}####    ####       ###     ####      #### ####    #####      ###"
  echo -e "     ${RED}####    ####      #####    #####     #### ####   #####      #####"
  echo -e "     ${RED}####    ####     #######   ######    #### #### #####       #######"
  echo -e "     ${RED}############    #### ####  #######   #### #########       #### ####"
  echo -e "     ${RED}############   ####   #### ########  #### ##########     ####   ####"
  echo -e "     ${RED}####    ####  ####     ######## #### #### ##### #####   ####     ####"
  echo -e "     ${RED}####    #### ####       #######  ######## ####   ##### ####       ####"
  echo -e "     ${RED}####    ########         ######   ####### ####    ########         ####"
  echo -e "     ${WHITE}       R       O       B       O       T       I       C       S      "
  echo ""
exit 0
