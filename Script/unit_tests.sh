#!/bin/bash

set -eo pipefail

xcrun xcodebuild \
  -project KeyboardAnimationSubscriber.xcodeproj \
  -scheme KeyboardAnimationSubscriber \
  -destination 'platform=iOS Simulator,name=iPhone 6,OS=latest' \
  test \
  | \
  bundle exec xcpretty --test --color
