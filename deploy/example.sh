#!/bin/bash
ROOT_LOCATION=$1
RELEASES_FOLDER=$ROOT_LOCATION/releases
WEBSITE_LOCATION=$RELEASES_FOLDER/$2

set_permissions() {
    cd $ROOT_LOCATION
    chown -R :devs $ROOT_LOCATION/ > /dev/null 2>&1
    chmod -R 2775 $ROOT_LOCATION/ > /dev/null 2>&1
}

echo "========== Setting permissions on $ROOT_LOCATION"
set_permissions

echo "========== Creating build in $WEBSITE_LOCATION"
cd $WEBSITE_LOCATION
npm ci  --silent
npm run build --silent

echo "-------------- Deploying main link"
ln -snf $WEBSITE_LOCATION/build $ROOT_LOCATION/current

echo "-------------- Deploying backup link"
ln -snf $WEBSITE_LOCATION/build $ROOT_LOCATION/backup

echo "========== Setting permissions after finalizing deployment on $ROOT_LOCATION"
set_permissions

echo "========== Cleaning up" 
cd $RELEASES_FOLDER
ls -lt | tail -n +4 | xargs rm -rf