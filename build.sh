#! /bin/bash

AWS_REGION=cn-north-1
AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"

KEDA_IMG=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com.cn/kedacore/keda:v2.0.0-arm64
KEDA_API_IMG=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com.cn/kedacore/keda-metrics-apiserver:v2.0.0-arm64

ARCH=arm64 make docker-build

docker tag kedacore/keda:v2.0.0 ${KEDA_IMG}
docker tag kedacore/keda-metrics-apiserver:v2.0.0 ${KEDA_API_IMG}
