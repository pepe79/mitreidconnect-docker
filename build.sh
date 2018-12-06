#!/bin/sh
# Usage $0 <branch>
# For example
#  ./build.sh master
#  ./build.sh 1.2.x
# latest stable branch is 1.2.x; master is the development version.
BRANCH=${1:-1.3.x}
version=`curl -s https://raw.githubusercontent.com/mitreid-connect/OpenID-Connect-Java-Spring-Server/$BRANCH/pom.xml \
   | sed -n -e '1,/\<version\>/s~^.*<version>\(.*\)</version>~\1~p'`
echo Current version of mitreid-connect is $version
docker build --no-cache --build-arg BRANCH=$BRANCH --tag marcelkottmann/mitreid-connect:$version --tag marcelkottmann/mitreid-connect:latest -f Dockerfile.mitreid-connect .


