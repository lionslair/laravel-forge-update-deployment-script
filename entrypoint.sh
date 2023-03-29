#!/bin/sh
set -e

AUTO_SOURCE="${AUTO_SOURCE:=false}"  # If variable not set or null, set it to default.

update_deploy_script() {
    curl \
        # --fail \
        # --silent \
        --show-error \
        --user-agent "Forge-GitHubAction/1.0" \
        --max-time 5 \
        --connect-timeout 5 \
        --request 'PUT' \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        --data '{"content": "$CONTENT", "auto_source": $AUTO_SOURCE}' \
        "https://forge.laravel.com/api/v1/servers/$SERVER_ID/sites/$SITE_ID/deployment/script"
}

if [ -n "$API_KEY" ]; then
    if [ -z "$SERVER_ID" ] || [ -z "$SITE_ID" ] || [ -z "$CONTENT" ]; then
        echo "SERVER_ID and SITE_ID and CONTENT environment variables must be set. Exiting."
        exit 1
    fi

    update_deploy_script
else
    echo "You must have API_KEY SERVER_ID SITE_ID and CONTENT along with the content and autosource setting Update Larvel Forge Deployment GitHub Action. Exiting."
    exit 1
fi
