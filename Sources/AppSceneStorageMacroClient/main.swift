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
  
  @SceneStorageKey("age", defaultValue: 24)
  var age: Int
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(age)
    age = 18
    print(age)
  }
}
#endif
