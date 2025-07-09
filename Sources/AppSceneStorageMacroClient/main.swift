//
//  main.swift
//  AppSceneStorage
//
//  Created by GodL on 2025/7/9.
//

import AppSceneStorageMacro
import Foundation

#if canImport(UIKit)
  import UIKit

  @UIKitSceneStorage
  class MyViewController: UIViewController {

    @SceneStorageKey("xxxxage", defaultValue: "nil")
    var age: String

    override func viewDidLoad() {
      super.viewDidLoad()

    }
  }
#endif
