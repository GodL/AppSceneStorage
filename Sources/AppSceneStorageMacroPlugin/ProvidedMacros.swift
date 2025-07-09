import SwiftCompilerPlugin
import SwiftSyntaxMacros
import SwiftSyntax
import SwiftDiagnostics

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
