#!/bin/sh

TOKEN=$1
APP_ID=$2
VERSION_ID=$3

mapps init -t $TOKEN

if [ -z "$APP_ID" ]; then
  APP_ID_ARG=""
else
  APP_ID_ARG="-a $APP_ID"
fi

if [ -z "$VERSION_ID" ]; then
  VERSION_ID_ARG=""
else
  VERSION_ID_ARG="-i $VERSION_ID"
fi


mapps app:promote $APP_ID_ARG $VERSION_ID_ARG
