import SwiftSyntax
import SwiftSyntaxMacros

public struct AppSceneStorageMacro: MemberMacro {
   
  public static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, conformingTo protocols: [TypeSyntax], in context: some MacroExpansionContext) throws -> [DeclSyntax] {
    guard let classDecl = declaration.as(ClassDeclSyntax.self) else {
      context.diagnose(.init(
        node: node,
        message: SimpleDiagnostic(message: "@UIKitSceneStorage can only be used for subclasses of UIViewController or UIView.")
      ))
      return []
    }
    return [
      DeclSyntax(stringLiteral: "lazy var _$sceneStorage: AppSceneStorage? = AppSceneStorage(self)")
    ]
  }
}
