#!/bin/bash

echo "Criando diretórios, caso não existam..."
# Confere se diretórios existem. Caso não existam, cria.
[ ! -d "/publico" ] && mkdir /publico
[ ! -d "/adm" ] && mkdir /adm
[ ! -d "/ven" ] && mkdir /ven
[ ! -d "/sec" ] && mkdir /sec

echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

declare -a grupo_adm=('carlos' 'maria' 'joao')
declare -a grupo_ven=('debora' 'sebastiana' 'roberto')
declare -a grupo_sec=('josefina' 'amanda' 'rogerio')

echo "Criando usuários administração e adicionando ao grupo GRP_ADM ->"
for usuario in ${grupo_adm[*]}; do
  useradd "$usuario" -m -s /bin/bash -G GRP_ADM -p "$(openssl passwd -crypt Adm123)"
done

echo "Criando usuários vendas e adicionando ao grupo GRP_VEN ->"
for usuario in ${grupo_ven[*]}; do
  useradd "$usuario" -m -s /bin/bash -G GRP_VEN -p "$(openssl passwd -crypt Vendas123)"
done

echo "Criando usuários secretaria e adicionando ao grupo GRP_SEC ->"
for usuario in ${grupo_sec[*]}; do
  useradd "$usuario" -m -s /bin/bash -G GRP_SEC -p "$(openssl passwd -crypt Secretaria123)"
done

echo "Configurando permissões da pasta adm..."
chown root:GRP_ADM /adm
chmod 770 /adm

echo "Configurando permissões da pasta ven..."
chown root:GRP_VEN /ven
chmod 770 /ven

echo "Configurando permissões da pasta sec..."
chown root:GRP_SEC /sec
chmod 770 /sec

chmod 777 /publico

echo "Fim do script..."
