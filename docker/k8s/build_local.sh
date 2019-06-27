#!/bin/bash

version=my3.0
repo=llh.com
file=vttablet

set -euxo pipefail

cd $GOPATH/src/vitess.io/vitess/go/cmd/vttablet
rm -f vttablet
go build

cd -
cp $GOPATH/src/vitess.io/vitess/go/cmd/vttablet/vttablet ./vttablet/

docker build -t $repo/vitess/$file:$version -f ./$file/Dockerfile.my_local  ./$file
docker push $repo/vitess/$file:$version

