#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

function check_env_variables(){
  [ ! "${ARM_TENANT_ID}" ] && echo "ERROR: Please set env variable ARM_TENANT_ID" && exit 1
  [ ! "${ARM_CLIENT_ID}" ] && echo "ERROR: Please set env variable ARM_CLIENT_ID" && exit 1
  [ ! "${ARM_CLIENT_SECRET}" ] && echo "ERROR: Please set env variable ARM_CLIENT_SECRET" && exit 1

  [ ! "${SUBSCRIPTION_NAME}" ] && echo "ERROR: Please set env variable SUBSCRIPTION_NAME" && exit 1
  [ ! "${RESOURCE_GROUP}" ] && echo "ERROR: Please set env variable RESOURCE_GROUP" && exit 1
  [ ! "${REGISTRY}" ] && echo "ERROR: Please set env variable REGISTRY" && exit 1
  [ ! "${IMAGES_TAG}" ] && echo "ERROR: Please set env variable IMAGES_TAG" && exit 1

  return 0
}

SCRIPTS_FOLDER="scripts"
APP_FOLDER="${SCRIPT_DIR}/.."

source variables.sh
check_env_variables

bash "${SCRIPTS_FOLDER}/000 - authenticate.sh" -t "${ARM_TENANT_ID}" -c "${ARM_CLIENT_ID}" -p "${ARM_CLIENT_SECRET}" -S "${SUBSCRIPTION_NAME}"

bash "${SCRIPTS_FOLDER}/010 - configure_cli.sh"

bash "${SCRIPTS_FOLDER}/020 - configure_subscription.sh"

bash "${SCRIPTS_FOLDER}/040 - prepare_application.sh" -D "${APP_FOLDER}"

bash "${SCRIPTS_FOLDER}/050 - build_containers.sh"  -D "${APP_FOLDER}" -V "${SCRIPTS_FOLDER}/999 - app_variables.sh"

# Population scripts to do not exits
bash "${SCRIPTS_FOLDER}/060 - populate_db.sh"  -D "${APP_FOLDER}" -V "${SCRIPTS_FOLDER}/999 - app_variables.sh"

bash "${SCRIPTS_FOLDER}/070 - deploy_app.sh" -V "${SCRIPTS_FOLDER}/999 - app_variables.sh"

