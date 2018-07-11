#!/bin/bash -e

NEO4J_VERSION=3.3.6
echo "=========== Installing neo4j $NEO4J_VERSION ==============="

NEO4J_TARBALL=neo4j-community-"$NEO4J_VERSION"-unix.tar.gz

NEO4J_URI=https://neo4j.com/artifact.php?name=neo4j-community-"$NEO4J_VERSION"-unix.tar.gz

curl --fail --show-error -o ${NEO4J_TARBALL} ${NEO4J_URI} \
    && tar --extract --file ${NEO4J_TARBALL} --directory /var/lib \
    && mv /var/lib/neo4j-* /var/lib/neo4j \
    && rm ${NEO4J_TARBALL}
