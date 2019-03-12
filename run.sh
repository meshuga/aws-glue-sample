#!/usr/bin/env bash
export AWS_DEFAULT_REGION=ap-southeast-1
export AWS_DEFAULT_PROFILE=personal

aws cloudformation deploy --template setup.yml --stack-name test-data-lake-stack --capabilities CAPABILITY_IAM

RIDES_BUCKET=$(aws cloudformation list-exports --query "Exports[?Name==\`RidesS3Bucket\`].Value" --no-paginate --output text)

#Data taken from https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page
aws s3 cp yellow_tripdata_2018-01_10k.csv s3://${RIDES_BUCKET}/raw/


