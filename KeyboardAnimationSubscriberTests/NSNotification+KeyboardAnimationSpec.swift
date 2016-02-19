//
//  NSNotification+KeyboardAnimationSpec.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Quick
import Nimble
@testable import KeyboardAnimationSubscriber

class NSNotification_KeyboardAnimationSpec: QuickSpec {
  override func spec() {

    describe("NSNotification extension") {

      context("when asked for the keyboard animation duration value") {

        context("when there is no such value in the user info dictionary") {
          it("returns .None") {
            expect(NSNotification(userInfo: [:]).keyboardAnimationCurve).to(beNil())
          }
        }

        context("when there is a value but of the wrong type") {
          it("returns .None") {
            let notification = NSNotification(userInfo: [UIKeyboardAnimationDurationUserInfoKey: "not a duration"])

            expect(notification.keyboardAnimationDuration).to(beNil())
          }
        }

        context("when there is a valid value") {
          it("returns .None") {
            let duration = NSTimeInterval(42)
            let notification = NSNotification(userInfo: [UIKeyboardAnimationDurationUserInfoKey: duration])

            expect(notification.keyboardAnimationDuration) == duration
          }
        }
      }

      context("when asked for the keyboard animation keyboard frame end value") {

        context("when there is no such value in the user info dictionary") {
          it("returns .None") {
            expect(NSNotification(userInfo: [:]).keyboardAnimationCurve).to(beNil())
          }
        }

        context("when there is a value but of the wrong type") {
          it("returns .None") {
            let notification = NSNotification(userInfo: [UIKeyboardFrameEndUserInfoKey: "not a frame"])

            expect(notification.keyboardFrameEnd).to(beNil())
          }
        }

        context("when there is a valid value") {
          it("returns the value") {
            let frame = CGRect(x: 1, y: 2, width: 3, height: 4)
            let notification = NSNotification(userInfo: [UIKeyboardFrameEndUserInfoKey: NSValue(CGRect: frame)])

            expect(notification.keyboardFrameEnd) == frame
          }
        }
      }

      context("when asked for the keyboard animation curve value") {

        context("when there is no such value in the user info dictionary") {
          it("returns .None") {
            expect(NSNotification(userInfo: [:]).keyboardAnimationCurve).to(beNil())
          }
        }

        context("when there is a value but of the wrong type") {
          it("returns .None") {
            let notification = NSNotification(userInfo: [UIKeyboardAnimationCurveUserInfoKey: "not a curve"])

            expect(notification.keyboardAnimationDuration).to(beNil())
          }
        }

        context("when there is a valid value") {
          it("returns .None") {
            let anyCurve = UIViewAnimationCurve.EaseIn
            let notification = NSNotification(userInfo: [UIKeyboardAnimationCurveUserInfoKey: anyCurve.rawValue])

            expect(notification.keyboardAnimationCurve) == anyCurve
          }
        }
      }
    }
  }
}
