#!/bin/bash
log()
{
echo -e "[`date '+%Y-+%m-+%d-+%T'`]:" $1
}
build_image()
{
log "INFO:starting building image of $1"
 docker build --build-arg BUILD_IMAGE_NAME=${BUILD_IMAGE} -t ${Build_Img} . --no-cache --force-rm
if [ $? -ne "0" ]; then
log "error:docker build failed"
exit
fi
}
push_image()
{
 docker login -u raviteja1121 -p $passwd
 if [ $? -ne "0" ]; then
 log "error:docker login failed"
 exit 1
 else
 log "INFO:docker login [[ success ]]"
 fi
 log "INFO:starting docker push.."
 docker tag ${Build_Img} raviteja1121/${Build_Img}
 docker push raviteja1121/${Build_Img}
 if [ $? -ne "0" ]; then
 log "error:docker push failed"
 exit 1
 else
 log "Info:docker push to registry succeeded"
 fi
}

if [ $# -eq 3 ]; then
BUILD_IMAGE=$1
Build_Img=$2
passwd=$3
else
Build_IAMAGE="centos"
Build_Img="pcentos"
fi
build_image
push_image
