#!/bin/bash -e

echo "=========== Installing neo4j 3.1.1==============="

# REFERENCE: OFFICIAL NEO4J image script
# https://github.com/neo4j/docker-neo4j-publish/blob/36ac547bcffcce2c7c0f249b340d062ba08e2598/3.1.0/community/Dockerfile

NEO4J_SHA256=47317a5a60f72de3d1b4fae4693b5f15514838ff3650bf8f2a965d3ba117dfc2
NEO4J_TARBALL=neo4j-community-3.1.1-unix.tar.gz
#NEO4J_URI=http://dist.neo4j.org/neo4j-community-3.1.1-unix.tar.gz
NEO4J_URI=https://neo4j.com/artifact.php?name=neo4j-community-3.1.1-unix.tar.gz


curl --fail --show-error -o ${NEO4J_TARBALL} ${NEO4J_URI} \
    && tar --extract --file ${NEO4J_TARBALL} --directory /var/lib \
    && mv /var/lib/neo4j-* /var/lib/neo4j \
    && rm ${NEO4J_TARBALL}

cd /var/lib/neo4j
