#!/bin/bash
cd "$(dirname "$0")"
~/flex_sdk/bin/mxmlc RocketGun.as -debug=true -static-link-runtime-shared-libraries=true && ~/flex_sdk/runtimes/player/11.1/mac/Flash\ Player\ Debugger.app/Contents/MacOS/Flash\ Player\ Debugger RocketGun.swf
# exit