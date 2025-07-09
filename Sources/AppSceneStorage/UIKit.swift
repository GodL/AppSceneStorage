//
//  UIKit.swift
//  AppSceneStorage
//
//  Created by GodL on 2025/7/8.
//

import Foundation
#if canImport(UIKit)
import UIKit

@available(iOS 13.0, *)
extension AppSceneStorage {
  @MainActor
  @inlinable
  @inline(__always)
  public init(_ scene: UIScene) {
    self.init(sceneID: scene.session.persistentIdentifier)
  }
  
  @MainActor
  @inlinable
  @inline(__always)
  public init?(_ view: UIView) {
    precondition(view.window?.windowScene != nil, "This view must be in view hierarchy")
    guard let scene = view.window?.windowScene else {
      return nil
    }
    self.init(scene)
  }
  
  @MainActor
  @inlinable
  @inline(__always)
  public init?(_ viewController: UIViewController) {
    precondition(viewController.view.window?.windowScene != nil, "This view controller must be in view hierarchy")
    guard let scene = viewController.view.window?.windowScene else {
      return nil
    }
    self.init(scene)
  }
}

#endif
