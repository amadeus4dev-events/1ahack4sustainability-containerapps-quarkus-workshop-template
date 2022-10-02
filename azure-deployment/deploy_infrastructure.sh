#!/usr/bin/env bash

set -e

function check_env_variables(){
  [ ! "${ARM_TENANT_ID}" ] && echo "ERROR: Please set env variable ARM_TENANT_ID" && exit 1
  [ ! "${ARM_CLIENT_ID}" ] && echo "ERROR: Please set env variable ARM_CLIENT_ID" && exit 1
  [ ! "${ARM_CLIENT_SECRET}" ] && echo "ERROR: Please set env variable ARM_CLIENT_SECRET" && exit 1

  [ ! "${SUBSCRIPTION_NAME}" ] && echo "ERROR: Please set env variable SUBSCRIPTION_NAME" && exit 1
  [ ! "${RESOURCE_GROUP}" ] && echo "ERROR: Please set env variable RESOURCE_GROUP" && exit 1
  [ ! "${LOCATION}" ] && echo "ERROR: Please set env variable LOCATION" && exit 1
  [ ! "${TAG}" ] && echo "ERROR: Please set env variable TAG" && exit 1
  [ ! "${LOG_ANALYTICS_WORKSPACE}" ] && echo "ERROR: Please set env variable LOG_ANALYTICS_WORKSPACE" && exit 1
  [ ! "${REGISTRY}" ] && echo "ERROR: Please set env variable REGISTRY" && exit 1
  [ ! "${IMAGES_TAG}" ] && echo "ERROR: Please set env variable IMAGES_TAG" && exit 1

  return 0
}

SCRIPTS_FOLDER="./azure-deployment/scripts"

# NOTES: Remove the variable script as we are using the Workflow to set the data
# source variables.shcheck_env_variables

bash "${SCRIPTS_FOLDER}/000 - authenticate.sh" -t "${ARM_TENANT_ID}" -c "${ARM_CLIENT_ID}" -p "${ARM_CLIENT_SECRET}" -S "${SUBSCRIPTION_NAME}"

bash "${SCRIPTS_FOLDER}/010 - configure_cli.sh"

bash "${SCRIPTS_FOLDER}/020 - configure_subscription.sh"

bash "${SCRIPTS_FOLDER}/030 - deploy_infra_resources.sh" -r "${RESOURCE_GROUP}" -l "${LOCATION}" -T "${TAG}" -L "${LOG_ANALYTICS_WORKSPACE}" -R "${REGISTRY}" -I "${IMAGES_TAG}" -V "${SCRIPTS_FOLDER}/999 - app_variables.sh"

