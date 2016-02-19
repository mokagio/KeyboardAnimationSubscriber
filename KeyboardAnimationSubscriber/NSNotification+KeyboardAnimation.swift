//
//  NSNotification+KeyboardAnimation.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import UIKit

extension NSNotification {

    var keyboardAnimationDuration: NSTimeInterval? {
        guard let duration = self.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSTimeInterval else {
            return .None
        }

        return duration
    }

    var keyboardAnimationCurve: UIViewAnimationCurve? {
        guard
            let rawValue = self.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int,
            let animationCurve = UIViewAnimationCurve(rawValue: rawValue)
            else {
                return .None
        }

        return animationCurve
    }

    var keyboardFrameEnd: CGRect? {
        guard let keyboardFrame = (self.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() else {
            return .None
        }

        return keyboardFrame
    }
}