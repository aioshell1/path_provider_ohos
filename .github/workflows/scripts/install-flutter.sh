#!/bin/bash

BRANCH=$1

git clone https://gitee.com/harmonycommando_flutter/flutter.git --depth 1 -b $BRANCH _flutter
echo "$GITHUB_WORKSPACE/_flutter/bin" >> $GITHUB_PATH
