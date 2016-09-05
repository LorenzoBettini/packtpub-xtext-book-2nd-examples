#!/bin/bash

set -ev
if [ "$TRAVIS_OS_NAME" == "osx" ]; then
	if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
		echo "Build on MacOSX: Pull Request"
		mvn -f org.example.parent/pom.xml clean verify
	else
		echo "Skipping build on MacOSX for standard commit"
		mvn -f org.example.parent/pom.xml clean verify
	fi
else
	echo "Build on Linux"
	mvn -f org.example.parent/pom.xml clean verify
fi 
