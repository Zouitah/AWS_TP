#!/bin/bash

INFRA_NAME=$1
TEMPLATE=$2
NB_INSTANCE=$3
WEB_PAGE=$4
KEY_NAME=$5

cp -r TEMPLATE/${TEMPLATE} DEPLOYED/${INFRA_NAME}

cd DEPLOYED/${INFRA_NAME}

if [ ${NB_INSTANCE} -gt 0 ]
then
	for (( i=4 ; i < $(($NB_INSTANCE+4))	; i++))
        do
            	cat instance.tf >> all_instances.tf
		sed -i "s|<##NUMERO_INSTANCE##>|$(($i-3))|g" all_instances.tf  
            	sed -i "s|<##NUMERO_INSTANCE_IP##>|${i}|g" all_instances.tf  
		echo "Instance $(($i-3)) ajouté dans le fichier all_instances.tf"
        done
	
        rm -rf instance.tf
fi

sed -i "s|<##WEB_PAGE##>|${WEB_PAGE}|g" * 
sed -i "s|<##NB_INSTANCE##>|${NB_INSTANCE}|g" * 
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

exit
