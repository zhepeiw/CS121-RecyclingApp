#! /bin/bash

# This is the CircleCI script for deploying
# master commit into aws ElasticBeanswalk
# Note that the server name needs to keep sync
# between the production server and the local VM

set -e

ASSET_DIR=recycling-server/public/assets
RDS_DB_PROD_NAME=recycling_app_db_prod
RDS_DB_PROD_HOST=recycling-app-db-prod.cajspzunyhon.us-east-1.rds.amazonaws.com
RDS_DB_PROD_PORT=3306

SHA1=$1
EB_BUCKET=cs121-recycling-server-core
ASSET_BUCKET=cs121-recycling-server-assets
DOCKERRUN_FILE=Dockerrun.aws.json
APPLICATION_NAME=cs121-recycling-app
ENVIRONMENT_NAME=cs121-recycling-server-prod

SOURCE_BUNDLE_NAME=cs121-recycling-server-source-bundle
HASHED_SOURCE_BUNDLE_NAME=$SHA1-$SOURCE_BUNDLE_NAME

# Construct production configuration files from
# production environment variables and templates.
construct_prod_configs() {
  sed -e "s/<TAG>/$SHA1/" \
      -e "s/<RDS_DB_PROD_NAME>/$RDS_DB_PROD_NAME/" \
      -e "s/<RDS_DB_PROD_HOST>/$RDS_DB_PROD_HOST/" \
      -e "s/<RDS_DB_PROD_PASSWORD>/$RDS_DB_PROD_PASSWORD/" \
      -e "s/<RDS_DB_PROD_PORT>/$RDS_DB_PROD_PORT/" \
      -e "s/<RDS_DB_PROD_USER>/$RDS_DB_PROD_USER/" \
      -e "s/<RAILS_SECRET_KEY_BASE>/$RAILS_SECRET_KEY_BASE/" \
      -e "s@<RAILS_ASSET_HOST>@$RAILS_ASSET_HOST@" \
      < $1 > $2
}

# Set working directory for the script to /ci
cd "$(dirname "$0")"
echo "CI dir is: $(pwd)"

printf "Start pushing the new image to Docker Hub...\n"
# Push a new version onto docker hub
docker push zhzhang2012/cs121-recycling-server-prod:$SHA1
printf "Finished pushing to Docker hub\n\n"

printf "Start configuring AWS CLI...\n"
aws --version
aws configure set default.region us-east-1
aws configure set default.output json
printf "Finished configuring awscli\n\n"

# Create new Elastic Beanstalk version
printf "Build Dockerrun file...\n"
construct_prod_configs Dockerrun.aws.json.template $DOCKERRUN_FILE

printf "Build source bundle for deployment..."
zip -r "$SOURCE_BUNDLE_NAME.zip" .ebextensions/ $DOCKERRUN_FILE

printf "Uploading source bundle to S3...\n"
aws s3 cp "$SOURCE_BUNDLE_NAME.zip" s3://$EB_BUCKET/$HASHED_SOURCE_BUNDLE_NAME.zip
printf "Finished uploading source bundle to S3\n\n"

printf "Start deploying to ElasticBeanstalk..."
aws elasticbeanstalk create-application-version --application-name $APPLICATION_NAME \
    --version-label $SHA1 --source-bundle S3Bucket=$EB_BUCKET,S3Key=$HASHED_SOURCE_BUNDLE_NAME.zip

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment --environment-name $ENVIRONMENT_NAME \
    --version-label $SHA1
printf "\n\n"

## Note(tony): Temporarily disable S3 upload to avoid costs, Wait for next month
## Note2(tony): can't do this since production will crash. Fuck rails.
aws s3 rm s3://$ASSET_BUCKET/assets --recursive
aws s3 cp --recursive $ASSET_DIR s3://$ASSET_BUCKET/assets --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
printf "Finished updating assets\n"

printf "#######################\n"
printf "# Finished deployment #\n"
printf "#######################\n"
