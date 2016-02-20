//
//  KeyboardAnimationSubscriber.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import UIKit

public class KeyboardAnimationSubscriber {

    public typealias KeyboardAnimationAction = (
        duration: NSTimeInterval,
        keyboardHeight: CGFloat,
        animationOptionCurve: UIViewAnimationOptions
        ) -> ()

    let willShowAction: KeyboardAnimationAction?
    let willHideAction: KeyboardAnimationAction?

    let notificationCenter: NSNotificationCenter

    public init(
        willShowAction: KeyboardAnimationAction?,
        willHideAction: KeyboardAnimationAction?,
        notificationCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        ) {
        self.willShowAction = willShowAction
        self.willHideAction = willHideAction
        self.notificationCenter = notificationCenter

        setupKeyboardNotificationObserving(self.notificationCenter)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    func setupKeyboardNotificationObserving(notificationCenter: NSNotificationCenter) {
        notificationCenter.addObserver(
            self,
            selector: Selector("keyboardWillBeShown:"),
            name: UIKeyboardWillShowNotification,
            object: .None
        )

        notificationCenter.addObserver(
            self,
            selector: Selector("keyboardWillBeHidden:"),
            name: UIKeyboardWillHideNotification,
            object: .None
        )
    }

    // MARK: Keyboard

    @objc func keyboardWillBeShown(notification: NSNotification) {
        guard let willShowAction = willShowAction else {
            return
        }

        guard let (duration, keyboardHeight, curveOption) = keyboardAnimationInfo(fromNotification: notification) else {
            return
        }

        willShowAction(duration: duration, keyboardHeight: keyboardHeight, animationOptionCurve: curveOption)
    }

    @objc func keyboardWillBeHidden(notification: NSNotification) {
        guard let willHideAction = willHideAction else {
            return
        }

        guard let (duration, keyboardHeight, curveOption) = keyboardAnimationInfo(fromNotification: notification) else {
            return
        }

        willHideAction(duration: duration, keyboardHeight: keyboardHeight, animationOptionCurve: curveOption)
    }

    func keyboardAnimationInfo(fromNotification notification: NSNotification) -> (
        NSTimeInterval, CGFloat, UIViewAnimationOptions
        )? {
            guard
                let duration = notification.keyboardAnimationDuration,
                let keyboardFrame = notification.keyboardFrameEnd,
                let animationCurve = notification.keyboardAnimationCurve
                else {
                    return .None
            }

            return (
                duration,
                keyboardFrame.size.height,
                UIViewAnimationOptions.option(withCurve: animationCurve)
            )
    }
}