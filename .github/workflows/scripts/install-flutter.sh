#!/bin/bash

BRANCH=$1

git clone https://gitee.com/harmonycommando_flutter/flutter.git -b $BRANCH _flutter
export FLUTTER_GIT_URL="https://gitee.com/harmonycommando_flutter/flutter.git"
echo "$GITHUB_WORKSPACE/_flutter/bin" >> $GITHUB_PATH
