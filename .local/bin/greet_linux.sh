#!/bin/sh

## ORIGINAL SOURCE: 
# https://github.com/konapun/dotfiles/blob/master/zsh/custom/greet.zsh

columns=$(tput cols)
[[ $columns -le 70 ]] && exit 0

RED='\033[1;33m'
WHITE='\033[1;37m'
TITLE1='\033[7;37m'
TITLE2='\033[7;37m'
BOLD=$(tput bold)
RESET=$(tput sgr0)
 
  echo -e "         ${TITLE1}${BOLD}                  自  由  ソ  フ  ト  ウ  ェ  ア                   ${RESET}"
  echo -e "       ${RED}   ######      ########  ####     ###### ####    #### ######  ###### "  
  echo -e "       ${RED}   ######      ########  #####    ###### ####    #### ######  ###### "   
  echo -e "       ${RED}    ####         ####    ######    ####  ####    ####   #########    "    
  echo -e "       ${RED}    ####         ####    #######   ####  ####    ####    #######     "     
  echo -e "       ${RED}    ####         ####    ########  ####  ####    ####    ########    "      
  echo -e "       ${RED}    ####    ##   ####    #### #### ####  ####    ####   ##########   "       
  echo -e "       ${RED}   ########### ######## ###### ########  ############ ######  ###### "        
  echo -e "       ${RED}   ########### ######## ######  #######   ##########  ######  ###### ${RESET}"         
  echo -e "         ${TITLE2}${BOLD}  G  N  U       O  P  E  R  A  T  I  N  G       S  Y  S  T  E  M   ${RESET}"
  echo ""
exit 0
