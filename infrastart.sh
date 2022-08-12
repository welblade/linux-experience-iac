#!/bin/env bash
declare -a groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")
declare -a dirs=("publico root 777" "adm GRP_ADM 770" "ven GRP_VEN 770" "sec GRP_SEC 770")
declare -a users=("carlos GRP_ADM" "maria GRP_ADM" "joao GRP_ADM" "debora GRP_VEN" "sebastiana GRP_VEN" "roberto GRP_VEN" "josefina GRP_SEC" "amanda GRP_SEC" "rogerio GRP_SEC")

echo "Criando os grupos" "${groups[@]}"
for group in "${groups[@]}";
do 
  if [ "$(getent group ${group})" ]; then
    echo "Não há necessidade de criar o grupo ${group}."
  else
    groupadd "${group}"
  fi
done

echo "Criando os diretórios."
for t_dir in "${dirs[@]}";
do
    declare -a dir_conf=(${t_dir})
    mkdir -p "/shared/${dir_conf[0]}"
    chgrp "${dir_conf[1]}" "/shared/${dir_conf[0]}" 
    chmod "${dir_conf[2]}" "/shared/${dir_conf[0]}"
done

echo "Criando usuários."
for t_user in "${users[@]}";
do
    declare -a user_conf=(${t_user})
    useradd "${user_conf[0]}" -m -G "${user_conf[1]}" -s /bin/bash -p "$(openssl passwd -6 123459)" 
    usermod -e "${user_conf[0]}"
done