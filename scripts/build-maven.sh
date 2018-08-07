#!/bin/bash
#
# Simple script that builds a maven project and renames the output to match entrypoint in Dockerfile.
#
# Found here: https://gitlab.com/NiclasG/cookbook/tree/master/scripts
# Niclas <niclas@trimigo.se>
#

set -x
set -e

mvn -B clean package -DskipTests

echo 'Install into the local Maven repository'
mvn jar:jar install:install

NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`

mv  target/${NAME}-${VERSION}.jar target/entrypoint.jar


