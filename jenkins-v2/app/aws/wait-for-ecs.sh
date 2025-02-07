#!/bin/bash

# Configurable timeout
TIMEOUT=1200  # 20 minutes
INTERVAL=15   # Check every 15 seconds

echo "⏳ Waiting for ECS service to stabilize..."

while [[ $TIMEOUT -gt 0 ]]; do
    STATUS=$(aws ecs describe-services --cluster "$1" --services "$2" --query "services[0].deployments[0].rolloutState" --output text)

    if [[ "$STATUS" == "COMPLETED" ]]; then
        echo "Deployment successful!"
        exit 0
    elif [[ "$STATUS" == "FAILED" ]]; then
        echo "Deployment failed!"
        exit 1
    fi

    echo "⏳ Still waiting for deployment... ($TIMEOUT seconds left)"
    sleep $INTERVAL
    TIMEOUT=$((TIMEOUT-INTERVAL))
done

echo "ECS deployment timed out!"
exit 1
