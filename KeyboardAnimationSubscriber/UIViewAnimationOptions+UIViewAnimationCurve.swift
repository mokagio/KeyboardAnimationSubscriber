//
//  UIViewAnimationOptions+UIViewAnimationCurve.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import UIKit

extension UIViewAnimationOptions {

    /**
     Returns the `UIViewAnimationOptions` value corresponding to the given
     `UIViewAnimationCurver`.

     - parameter curve: The `UIViewAnimationCurve` you want to match.

     - returns: The matching `UIViewAnimationOptions`
     */
    static func option(withCurve curve: UIViewAnimationCurve) -> UIViewAnimationOptions {
        switch curve {
        case .EaseIn: return UIViewAnimationOptions.CurveEaseIn
        case .EaseInOut: return UIViewAnimationOptions.CurveEaseInOut
        case .EaseOut: return UIViewAnimationOptions.CurveEaseOut
        case .Linear: return UIViewAnimationOptions.CurveLinear
        }
    }
}