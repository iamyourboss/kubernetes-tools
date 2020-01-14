#!/usr/bin/env bash
#usage: imagename:version
docker pull gcr.azk8s.cn/google_containers/$1:$2
docker tag gcr.azk8s.cn/google_containers/$1:$2 k8s.gcr.io/$1:$2
docker save k8s.gcr.io/$1:$2 > $1.tar
microk8s.ctr -n k8s.io image import $1.tar
