#!/bin/bash

BRANCH=$1

git clone https://github.com/flutter/flutter.git --depth 1 -b stable _flutter
echo "$GITHUB_WORKSPACE/_flutter/bin" >> $GITHUB_PATH
