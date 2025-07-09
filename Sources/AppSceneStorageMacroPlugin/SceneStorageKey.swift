//
//  SceneStorageKey.swift
//  AppSceneStorage
//
//  Created by GodL on 2025/7/9.
//

import SwiftSyntax
import SwiftSyntaxMacros

public struct SceneStorageKeyMacro: AccessorMacro {
  public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingAccessorsOf declaration: some SwiftSyntax.DeclSyntaxProtocol, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.AccessorDeclSyntax] {
    guard let property = declaration.as(VariableDeclSyntax.self),
          let binding = property.bindings.first,
          let identifier = binding.pattern.as(IdentifierPatternSyntax.self),
          binding.accessorBlock == nil,
          let arguments = node.arguments?.as(LabeledExprListSyntax.self) else {
      return []
    }
    guard property.bindingSpecifier.tokenKind == .keyword(.var) else {
      context.diagnose(.init(
        node: node,
        message: SimpleDiagnostic(message: "@UISceneStorageKey can only be used for var")
      ))
      return []
    }
    
    guard let storageKey = arguments.first?.expression.as(StringLiteralExprSyntax.self)?.segments.first?.as(StringSegmentSyntax.self)?.content else {
      return []
    }
    let set: AccessorDeclSyntax =
    """
    set {
      _$sceneStorage.set(newValue, forKey: "\(storageKey)")
    }
    """
    var result: [AccessorDeclSyntax] = [set]
    var get: AccessorDeclSyntax! = nil
    if arguments.count > 1 {
      let _expr = arguments.last!.expression
      if let expr = _expr.as(IntegerLiteralExprSyntax.self) {
        if let defaultValue = Int(expr.literal.text) {
          get =
          """
          get {
            if let value = _$sceneStorage.object(forKey: "\(storageKey)") as? Int {
              return value
            }
            _$sceneStorage.register(defaultValue, forKey: "\(storageKey)")
            return \(raw: defaultValue)
          }
          """
        }
      } else if let expr = _expr.as(BooleanLiteralExprSyntax.self) {
        if let defaultValue = Bool(expr.literal.text) {
          get =
          """
          get {
            if let value = _$sceneStorage.object(forKey: "\(storageKey)") as? Bool {
              return value
            }
            _$sceneStorage.register(defaultValue, forKey: "\(storageKey)")
            return \(raw: defaultValue)
          }
          """
        }
      } else if let expr = _expr.as(FloatLiteralExprSyntax.self) {
        if let defaultValue = Float(expr.literal.text) {
          get =
          """
          get {
            if let value = _$sceneStorage.object(forKey: "\(storageKey)") as? Float {
              return value
            }
            _$sceneStorage.register(defaultValue, forKey: "\(storageKey)")
            return \(raw: defaultValue)
          }
          """
        }
      } else if let expr = _expr.as(StringLiteralExprSyntax.self) {
        if let defaultValue = expr.segments.first?.as(StringSegmentSyntax.self)?.content {
          get =
          """
          get {
            if let value = _$sceneStorage.object(forKey: "\(storageKey)") as? String {
              return value
            }
            _$sceneStorage.register(defaultValue, forKey: "\(storageKey)")
            return \(raw: defaultValue)
          }
          """
        }
      } 
    }
    if get == nil {
      get =
      """
      get {
        return _$sceneStorage.object(forKey: "\(storageKey)")
      }
      """
    }
    result.append(get)
    return result
  }
}
