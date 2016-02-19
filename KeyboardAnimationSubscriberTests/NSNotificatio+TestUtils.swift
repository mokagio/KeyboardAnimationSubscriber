//
//  NSNotificatio+TestUtils.swift
//  KeyboardAnimationSubscriber
//
//  Created by Giovanni on 19/02/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Foundation

extension NSNotification {

  convenience init(userInfo: [NSObject: AnyObject]?) {
    self.init(name: "test", object: .None, userInfo: userInfo)
  }
}