//
//  KeyboardAnimationSubscriberSpec.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Quick
import Nimble
@testable import KeyboardAnimationSubscriber


class KeyboardAnimationSubscriberSpec: QuickSpec {
  override func spec() {

    describe("KeyboardAnimationSubscriber") {

      let notificationCenter = NSNotificationCenter.defaultCenter()

      context("when a keyboard will show notification is fired") {
        it("runs the will show action passing the animation values") {
          let anyDuration: NSTimeInterval = 42
          let anyHeight: CGFloat = 123
          let anyAnimationOptionsCurve = UIViewAnimationOptions.CurveEaseInOut
          let anyMatchingAnimatioCurve = UIViewAnimationCurve.EaseInOut
          let userInfo: [NSObject: AnyObject] = [
            UIKeyboardAnimationCurveUserInfoKey: anyMatchingAnimatioCurve.rawValue,
            UIKeyboardFrameEndUserInfoKey: NSValue(CGRect: CGRect(x: 1, y: 2, width: 3, height: anyHeight)),
            UIKeyboardAnimationDurationUserInfoKey: anyDuration
          ]

          var callbackDidRunSensor = false
          // We have to make due with the warning, because if we use `let _` 
          // the object is not retained, which means that its callbacks will not
          // execute.
          //
          // Another option would be to have the sut as an instance variable of
          // the spec, but I prefer this.
          let sut = KeyboardAnimationSubscriber(
            willShowAction: { (duration, keyboardHeight, animationOptionCurve) -> () in
              expect(duration) == anyDuration
              expect(keyboardHeight) == anyHeight
              expect(animationOptionCurve) == anyAnimationOptionsCurve

              callbackDidRunSensor = true
            },
            willHideAction: .None,
            notificationCenter: notificationCenter
          )

          notificationCenter.postNotificationName(
            UIKeyboardWillShowNotification,
            object: .None,
            userInfo: userInfo
          )

          expect(callbackDidRunSensor).toEventually(beTrue())
        }
      }

      context("when a keyboard will hide notification is fired") {
        it("runs the will hide action passing the animation values") {
          let anyDuration: NSTimeInterval = 42
          let anyHeight: CGFloat = 123
          let anyAnimationOptionsCurve = UIViewAnimationOptions.CurveEaseInOut
          let anyMatchingAnimatioCurve = UIViewAnimationCurve.EaseInOut
          let userInfo: [NSObject: AnyObject] = [
            UIKeyboardAnimationCurveUserInfoKey: anyMatchingAnimatioCurve.rawValue,
            UIKeyboardFrameEndUserInfoKey: NSValue(CGRect: CGRect(x: 1, y: 2, width: 3, height: anyHeight)),
            UIKeyboardAnimationDurationUserInfoKey: anyDuration
          ]

          var callbackDidRunSensor = false
          // We have to make due with the warning, because if we use `let _` 
          // the object is not retained, which means that its callbacks will not
          // execute.
          //
          // Another option would be to have the sut as an instance variable of
          // the spec, but I prefer this.
          let sut = KeyboardAnimationSubscriber(
            willShowAction: .None,
            willHideAction: { (duration, keyboardHeight, animationOptionCurve) -> () in
              expect(duration) == anyDuration
              expect(keyboardHeight) == anyHeight
              expect(animationOptionCurve) == anyAnimationOptionsCurve

              callbackDidRunSensor = true
            },
            notificationCenter: notificationCenter
          )

          notificationCenter.postNotificationName(
            UIKeyboardWillHideNotification,
            object: .None,
            userInfo: userInfo
          )

          expect(callbackDidRunSensor).toEventually(beTrue())
        }
      }
    }
  }
}
