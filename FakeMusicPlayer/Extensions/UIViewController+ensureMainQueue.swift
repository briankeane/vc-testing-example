//
//  UIViewController+ensureMainQueue.swift
//  FakeMusicPlayer
//
//  Created by Brian Keane on 2/5/21.
//

import Foundation

extension ViewController {
  func ensureMainQueue(using closure: @escaping () -> Void) {
    // If we are already on the main thread, execute the closure directly
    if Thread.isMainThread {
      closure()
    } else {
      DispatchQueue.main.async(execute: closure)
    }
  }
}
