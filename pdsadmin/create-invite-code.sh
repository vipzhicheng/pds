#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

PDS_ENV_FILE=${PDS_ENV_FILE:-"/home/ubuntu/source/bluesky-selfhost-env/config/secrets-passwords.env"}
source "${PDS_ENV_FILE}"
PDS_HOSTNAME="pds.si46.world"
curl \
  --fail \
  --silent \
  --show-error \
  --request POST \
  --user "admin:${PDS_ADMIN_PASSWORD}" \
  --header "Content-Type: application/json" \
  --data '{"useCount": 1}' \
  "https://${PDS_HOSTNAME}/xrpc/com.atproto.server.createInviteCode" | jq --raw-output '.code'
