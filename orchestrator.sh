#!/bin/bash

INFRA_NAME=$1
TEMPLATE=$2
NB_INSTANCE=$3
KEY_NAME="AEL_key"

cp -r TEMPLATE/${TEMPLATE} DEPLOYED/${INFRA_NAME}

cd DEPLOYED/${INFRA_NAME}

if [ ${NB_INSTANCE} -gt 0 ]
then
        for i in {1..${NB_INSTANCE}}
        do
            cp instance.tf instance_${i}.tf
            sed -i "s|<##NUMERO_INSTANCE##>|${i}|g" instance${i}.tf
            echo "Fichier d'instance ${i} généré"
        done

        rm -rf instance.tf
fi

sed -i "s|<##INFRA_NAME##>|${INFRA_NAME}|g" *
sed -i "s|<##KEY_NAME##>|${KEY_NAME}|g" *

terraform init

terraform apply -auto-approve

IP=$(cat temp_ip)

NB_SPACE=$(( 16 - $(echo ${IP} | wc -c) ))

SPACES=""

I=0

while [ $I -lt $NB_SPACE ]
do
        SPACES=${SPACES}" "
        I=$(( $I + 1 ))
done

cat << EOF

############################################################
############################################################
########                                           #########
########                                           #########
########    Web App Available at : ${IP}${SPACES}#########
########                                           #########
########                                           #########
############################################################
############################################################

EOF

rm temp_ip

exit
