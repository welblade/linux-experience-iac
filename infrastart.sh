#!/bin/env bash
GROUPS=("GRP_ADM" "GRP_VEN" "GRP_SEC")
DIRS=("publico root 777" "adm GRP_ADM 770" "ven GRP_VEN 770" "sec GRP_SEC 770")
USERS=("carlos GRP_ADM" "maria GRP_ADM" "joao GRP_ADM" "debora GRP_VEN" "sebastiana GRP_VEN" "roberto GRP_VEN" "josefina GRP_SEC" "amanda GRP_SEC" "rogerio GRP_SEC")

echo "Criando os grupos" "${GROUPS[@]}"
for group in "${GROUPS[@]}"
do 
  if [ "$(getent group admin)" ]; then
    echo "Não há necessidade de criar o grupo ${group}."
  else
    echo "groupadd ${group}"
  fi
done

echo "Criando os diretórios."
for t_dir in "${DIRS[@]}"
do
    dir_conf=("${t_dir}")
    mkdir -p "/shared/${dir_conf[0]}"
    chgrp "${dir_conf[1]}" "/shared/${dir_conf[0]}" 
    chmod "${dir_conf[2]}" "/shared/${dir_conf[0]}"
done

echo "Criando usuários."
for t_user in "${USERS[@]}"
do
    user_conf=("${t_user}")
    useradd "${user_conf[0]}" -m -G "${user_conf[1]}" -s /bin/bash -p "$(openssl passwd -6 123459)" 
    usermod -e "${user_conf[0]}"
done
