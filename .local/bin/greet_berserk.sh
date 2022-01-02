#!/bin/sh

columns=$(tput cols)
[[ $columns -le 70 ]] && exit 0

RED='\033[1;31m'
WHITE='\033[1;37m'
TITLE='\033[2;37m'
BOLD=$(tput bold)
RESET=$(tput sgr0)
 
  echo -e "${RED}             .:|vSoJ:                        :f/                 :ZQ@Qe.           "
  echo -e "${RED}        .;7PQ@@QQH9Q@{                    ¨cN@t;                ;Q@@@@U            "
  echo -e "${RED}   .^JUQ@@QUz;,¨¨¨,>@Q                   .Q@@Q:                  ¨@@@@f   ./KZr    "
  echo -e "${RED} OQ@@@QS*..oT   :>/Q@r ...:?¨.:|yUgQ@@Q&^N@@Q,    .:dIJ| ,X&Q@@QD.Q@@@v  ?Q@@@k¨   "
  echo -e "${RED}:UQe^¨   ^Q@L.|X@@@@: ,@@@@@Uo&OOgv N@@@@@@N¨ . OQ@NXZP /kXv^|&@@DQ@@@L/Q@@Qz.     "
  echo -e "${RED}        ¨@@@Rr  ¨7@@B:@@Hv¨¨´  cQ& ,@@@Q@@@Sr.:¨¨Q@?    |@@d.e@@Q]Q@@@@@@U^        "
  echo -e "${RED}         z@@&*    d@@9Q@N{c,  k@@Q@@@#:¨JU#@@@@@OQ@QQ@@.|@@Q@@@N^¨B@@@@@7          "
  echo -e "${RED}          Q@k:  ¨e@@@zJ@@@Q[| ,Q@@@@Q;    .*{Q@@Q@@[    :@@@@@f   N@@@mQ@Q/        "
  echo -e "${RED}         ¨@@QLve@@@Q* {@u,     Q@U@@QR,     ]@@Q>U@;;:,.,Q@QeB#e*¨9@@Q  ^k@Q>      "
  echo -e "${RED}         ¨@@#R@@@@f¨  c@@@@@Q:¨@@,¨|K@T;  ¨;Q@N, y@UJ{{7~@@d  .?]mg@@B    .zH9:    "
  echo -e "${RED}          @@@@@@N,    ,;L:,,.  @@:    ¨*,¨.PQ*   :;     >@@u      /@@K       .zv~  "
  echo -e "${RED}          Q@D:|L¨              NQ¨       ¨k*¨            ,        ^@@K¨         ¨. "
  echo -e "${RED}          OQ^*                 ^;                                 ^@@Q,            "
  echo -e "${RED}          >c¨                                                     ,k*¨             "
  echo -e "${TITLE}${BOLD}                                ベ    ル    セ   ル    ク${RESET}"
exit 0

