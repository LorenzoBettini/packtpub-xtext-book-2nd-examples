#!/bin/bash

set -ev

# to reduce the verbosity of Maven (downloading log)
# to avoid the Travis error
# "The job exceeded the maximum log length, and has been terminated."
MAVEN_ARGS="-B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn"

mvn $MAVEN_ARGS -f org.example.parent/pom.xml clean verify -Pall
# cd org.example.helloidea.parent && ./gradlew clean build

