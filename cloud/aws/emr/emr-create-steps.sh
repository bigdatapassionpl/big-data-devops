#!/usr/bin/env bash

aws emr add-steps \
  --cluster-id 'j-3JXA7FKASB1K0' \
  --steps file://emr-steps.json \
  --profile default