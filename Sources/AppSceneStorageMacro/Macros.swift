//
//  Macros.swift
//  AppSceneStorage
//
//  Created by GodL on 2025/7/9.
//

import Foundation

@attached(member, names: named(_$sceneStorage))
public macro UIKitSceneStorage() = #externalMacro(module: "AppSceneStorageMacroPlugin", type: "AppSceneStorageMacro")

@attached(accessor)
public macro SceneStorageKey(_ key: String, defaultValue: Any? = nil) = #externalMacro(module: "AppSceneStorageMacroPlugin", type: "SceneStorageKeyMacro")
