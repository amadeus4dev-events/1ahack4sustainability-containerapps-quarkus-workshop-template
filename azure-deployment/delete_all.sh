#!/usr/bin/env bash

set -e

function check_env_variables(){
  [ ! "${ARM_TENANT_ID}" ] && echo "ERROR: Please set env variable ARM_TENANT_ID" && exit 1
  [ ! "${ARM_CLIENT_ID}" ] && echo "ERROR: Please set env variable ARM_CLIENT_ID" && exit 1
  [ ! "${ARM_CLIENT_SECRET}" ] && echo "ERROR: Please set env variable ARM_CLIENT_SECRET" && exit 1

  [ ! "${SUBSCRIPTION_NAME}" ] && echo "ERROR: Please set env variable SUBSCRIPTION_NAME" && exit 1

  return 0
}

SCRIPTS_FOLDER="scripts"

source variables.sh
check_env_variables

bash "${SCRIPTS_FOLDER}/000 - authenticate.sh" -t "${ARM_TENANT_ID}" -c "${ARM_CLIENT_ID}" -p "${ARM_CLIENT_SECRET}" -S "${SUBSCRIPTION_NAME}"

az group delete \
  --name "$RESOURCE_GROUP"