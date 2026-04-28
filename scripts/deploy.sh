#!/bin/bash
REGION="eu-west-1"
PROJECT="bg-advanced"
NEW_VERSION=$1

if [ -z "$NEW_VERSION" ]; then
  echo "Usage: ./deploy.sh v2"
  exit 1
fi

echo "==> Getting ALB info..."
ALB_ARN=$(aws elbv2 describe-load-balancers --names "$PROJECT-alb" --region $REGION --query "LoadBalancers[0].LoadBalancerArn" --output text)
LISTENER_ARN=$(aws elbv2 describe-listeners --load-balancer-arn $ALB_ARN --region $REGION --query "Listeners[0].ListenerArn" --output text)
GREEN_TG_ARN=$(aws elbv2 describe-target-groups --names "$PROJECT-green-tg" --region $REGION --query "TargetGroups[0].TargetGroupArn" --output text)

echo "==> Switching traffic to Green ($NEW_VERSION)..."
aws elbv2 modify-listener \
  --listener-arn $LISTENER_ARN \
  --default-actions Type=forward,TargetGroupArn=$GREEN_TG_ARN \
  --region $REGION

echo "==> Done! Traffic is now on Green."
