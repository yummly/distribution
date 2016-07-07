#!/bin/bash
im=yummly/registry:2
set -e

# build the executable
docker build -t $im-stage .
# build the small image using the executable and other files from the staging image
bash -evx build-small-image.sh $im $im-stage /go/bin/registry
# stage image no longer needed
docker rmi $im-stage
