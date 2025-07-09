# AppSceneStorage
Make SwiftUI SceneStorage to UIKit

# Usage

```swift
import Foundation
import AppSceneStorageMacro
#if canImport(UIKit)
import UIKit

@UIKitSceneStorage
class MyViewController: UIViewController {
  
  @SceneStorageKey("xxxxage", defaultValue: 24)
  var age: Int
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(age)
    age = 18
    print(age)
  }
}
#endif
```