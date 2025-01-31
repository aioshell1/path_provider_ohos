#!/bin/bash

set -e

flutter config --no-analytics
flutter pub global activate melos 6.3.2
echo "$HOME/.pub-cache/bin" >> $GITHUB_PATH
echo "$HOME/AppData/Local/Pub/Cache/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/_flutter/.pub-cache/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/_flutter/bin/cache/dart-sdk/bin" >> $GITHUB_PATH

ACTION=$1
if [ "$ACTION" = "android" ]
then
    # android 编译环境是macos-13
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_mac_505_release/commandline-tools.a00
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_mac_505_release/commandline-tools.a01
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_mac_505_release/commandline-tools.a02

fi

if [ "$ACTION" == "linux" ]
then
    # android 编译环境是macos-13
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_linux_505_release/commandline-tools.a00
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_linux_505_release/commandline-tools.a01
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_linux_505_release/commandline-tools.a02
    wget --no-verbose https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_linux_505_release/commandline-tools.a03

fi

if [ "$ACTION" == "windows" ]
then
    curl -L -o commandline-tools.a00 https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_windows_505_release/commandline-tools.a00
    curl -L -o commandline-tools.a01 https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_windows_505_release/commandline-tools.a01
    curl -L -o commandline-tools.a02 https://github.com/aioshell1/HarmonyOSTools/releases/download/tools_windows_505_release/commandline-tools.a02

fi

cat commandline-tools* > commandline-tools.zip
unzip -q commandline-tools.zip
echo "$GITHUB_WORKSPACE/command-line-tools/bin" >> $GITHUB_PATH
echo "DEVECO_SDK_HOME=$GITHUB_WORKSPACE/command-line-tools/sdk" >> $GITHUB_ENV
echo "$GITHUB_WORKSPACE/command-line-tools/ohpm/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/command-line-tools/hvigor/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/command-line-tools/tool/node/bin" >> $GITHUB_PATH

flutter doctor -v


