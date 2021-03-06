#!/bin/bash

VERSION=$1

if test -z "${VERSION}" ; then 
    echo "usage: $0 Revision"
    exit 1
fi

mkdir jessie/${VERSION}
cp arangod-docker.conf HELP.md start.sh jessie/${VERSION}/
cat Dockerfile.templ | sed \
    -e "s;@VERSION@;${VERSION};" \
    > jessie/${VERSION}/Dockerfile

git add jessie/${VERSION}
git commit jessie/${VERSION}