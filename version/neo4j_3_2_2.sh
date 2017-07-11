#!/bin/bash -e

echo "=========== Installing neo4j 3.2.2==============="


NEO4J_SHA256=47317a5a60f72de3d1b4fae4693b5f15514838ff3650bf8f2a965d3ba117dfc2
NEO4J_TARBALL=neo4j-community-3.2.2-unix.tar.gz

NEO4J_URI=https://neo4j.com/artifact.php?name=neo4j-community-3.2.2-unix.tar.gz


curl --fail --show-error -o ${NEO4J_TARBALL} ${NEO4J_URI} \
    && tar --extract --file ${NEO4J_TARBALL} --directory /var/lib \
    && mv /var/lib/neo4j-* /var/lib/neo4j \
    && rm ${NEO4J_TARBALL}

cd /var/lib/neo4j
