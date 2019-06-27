
version=vt3.0
repo=llh.com

set -euxo pipefail

cd ../../
make docker_base
cd -

docker build -t vitess/k8s -f Dockerfile.my .

for file in vtctld vtgate vtworker vttablet mysqlctld
#for file in vttablet 
do

   if [ -d "$file" ];then
     echo "build $file"
     if [ "$file" = "base" ];then
       docker build -t debian:$file ./$file
     else
       sed 's/debian:stretch-slim/debian:base/g' ./$file/Dockerfile > ./$file/Dockerfile.my
       docker build -t $repo/vitess/$file:$version -f ./$file/Dockerfile.my  ./$file
       docker push $repo/vitess/$file:$version
     fi
   fi
done
