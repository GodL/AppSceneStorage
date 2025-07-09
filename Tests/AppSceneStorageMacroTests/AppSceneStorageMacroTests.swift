//
//  AppSceneStorageMacroTest.swift
//  AppSceneStorage
//
//  Created by GodL on 2025/7/9.
//

import AppSceneStorageMacroPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import Testing

let testingMacros: [String: Macro.Type] = [
  "UIKitSceneStorage": AppSceneStorageMacro.self,
  "SceneStorageKey": SceneStorageKeyMacro.self,
]

@Test func testUIKitSceneStorageMacro() {
  assertMacroExpansion(
    """
      @UIKitSceneStorage 
      class MyViewController: UIViewController {

        @SceneStorageKey("xxxxxx")
        var age: Int = 5
      }
    """,
    expandedSource:
      """
      class MyViewController: UIViewController {
        lazy var _sceneStorage: AppSceneStorage? = AppSceneStorage(self)

        var age: Int = 5 {
          willSet {
            $age = newValue
          }
        }
      }
      """
    ,
    macros: testingMacros)
}
