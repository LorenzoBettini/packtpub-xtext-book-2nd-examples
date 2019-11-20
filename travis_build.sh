#!/bin/bash

set -ev

# to reduce the verbosity of Maven (downloading log)
# to avoid the Travis error
# "The job exceeded the maximum log length, and has been terminated."
MAVEN_ARGS="-B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn"

if [ "$TRAVIS_OS_NAME" == "osx" ]; then
	if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
		echo "Build on MacOSX: Pull Request"
		mvn $MAVEN_ARGS -f org.example.parent/pom.xml clean verify -Pall
		# cd org.example.helloidea.parent && ./gradlew clean build
	else
		echo "Skipping build on MacOSX for standard commit"
		#mvn -f org.example.parent/pom.xml clean verify
	fi
else
	echo "Build on Linux"
	mvn $MAVEN_ARGS -f org.example.parent/pom.xml clean verify -Pall
	# cd org.example.helloidea.parent && ./gradlew clean build
fi 
