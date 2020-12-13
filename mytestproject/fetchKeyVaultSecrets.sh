#!/bin/bash
token=`curl -X GET -s "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fvault.azure.net" -H "Metadata: true" | jq -r ".access_token"`

secret=`curl -s "https://lh007vault.vault.azure.net/secrets/LH007Secret?api-version=2016-10-01" -H "Authorization: Bearer ${token}" | jq -r ".value"` 

echo ${secret}
