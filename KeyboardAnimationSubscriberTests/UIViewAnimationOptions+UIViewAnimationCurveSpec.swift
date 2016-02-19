//
//  UIViewAnimationOptions+UIViewAnimationCurveSpec.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Quick
import Nimble
@testable import KeyboardAnimationSubscriber

class UIViewAnimationOptions_UIViewAnimationCurveSpec: QuickSpec {
  override func spec() {

    describe("UIViewAnimationOptions extension") {

      context("when returning the option for a UIViewAnimationCurve") {

        it("it returns the option matching the curve") {
          expect(UIViewAnimationOptions.option(withCurve: .EaseIn)) == UIViewAnimationOptions.CurveEaseIn
          expect(UIViewAnimationOptions.option(withCurve: .EaseInOut)) == UIViewAnimationOptions.CurveEaseInOut
          expect(UIViewAnimationOptions.option(withCurve: .EaseOut)) == UIViewAnimationOptions.CurveEaseOut
          expect(UIViewAnimationOptions.option(withCurve: .Linear)) == UIViewAnimationOptions.CurveLinear
        }
      }
    }
  }
}
