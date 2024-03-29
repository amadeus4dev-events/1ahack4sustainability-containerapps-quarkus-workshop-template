#!/bin/bash

set -e

function usage () {
   echo "$(basename "$0") [-h] -t <tenant_id> -c <client_id> -p <client_secret> -S <subscription_name>"
}

while getopts "t:c:p:S:h" option; do
  case "$option" in
    t) ARM_TENANT_ID=$OPTARG;;
    c) ARM_CLIENT_ID=$OPTARG;;
    p) ARM_CLIENT_SECRET=$OPTARG;;
    S) SUBSCRIPTION_NAME=$OPTARG;;
    h  ) usage ; exit;;
    \? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
    :  ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    *  ) echo "Unimplemented option: -$option" >&2; exit 1;
  esac
done

if [ ! "${SUBSCRIPTION_NAME}" ]; then
  usage
  exit 1
fi

echo "# Authenticating..."
echo "#   Parameters"
echo "#    SUBSCRIPTION_NAME=${SUBSCRIPTION_NAME}"

az account show 2> /dev/null || az login --service-principal -u "${ARM_CLIENT_ID}" -p "${ARM_CLIENT_SECRET}" --tenant "${ARM_TENANT_ID}" --allow-no-subscriptions > /dev/null

az account set -s "${SUBSCRIPTION_NAME}" > /dev/null
