import SwiftCompilerPlugin
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

struct SimpleDiagnostic: DiagnosticMessage {
  var message: String
  var severity: DiagnosticSeverity { .error }
  var diagnosticID: MessageID {
    .init(domain: "UIKitSceneStorageMacro", id: "UIViewControllerRestriction")
  }
}

@main
struct AppSceneStorageMacroPluginMacros: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    AppSceneStorageMacro.self,
    SceneStorageKeyMacro.self,
  ]
}
