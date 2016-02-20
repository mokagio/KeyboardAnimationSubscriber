#!/bin/bash

set -eo pipefail

carthage_test_path=InstallationTests/KeyboardAnimationSubscriberCarthage

cd $carthage_test_path
carthage bootstrap
cd -

xcrun xcodebuild \
  -project "$carthage_test_path/KeyboardAnimationSubscriberCarthage".xcodeproj \
  -scheme KeyboardAnimationSubscriberCarthage \
  -destination 'platform=iOS Simulator,name=iPhone 6,OS=latest' \
  build \
  | \
  bundle exec xcpretty --color

