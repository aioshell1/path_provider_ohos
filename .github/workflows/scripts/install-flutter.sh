#!/bin/bash

set -e
BRANCH=$1

git clone https://gitee.com/harmonycommando_flutter/flutter.git -b $BRANCH _flutter
echo "$GITHUB_WORKSPACE/_flutter/bin" >> $GITHUB_PATH
echo "FLUTTER_GIT_URL=https://gitee.com/harmonycommando_flutter/flutter.git" >> $GITHUB_ENV

