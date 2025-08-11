# AppSceneStorage

A Swift package that brings SwiftUI's `SceneStorage` functionality to UIKit, enabling scene-level data persistence for UIKit applications.

## Features

- 🎯 **Scene-Level Storage**: Isolate data by UIScene using persistent identifiers
- 🔧 **Macro-Based API**: Simple and intuitive usage with Swift macros
- 📱 **UIKit Integration**: Seamlessly integrate with UIView and UIViewController
- 🚀 **Type Safety**: Support for all common data types with type-safe access
- 💾 **Persistent Storage**: Built on top of UserDefaults for reliable data persistence
- 🎨 **Modern Swift**: Built with Swift 6.0 and latest macro system

## Requirements

- iOS 13.0+
- macOS 10.15+
- watchOS 7.0+
- visionOS 1.0+
- Swift 6.0+

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/AppSceneStorage.git", from: "1.0.0")
]
```

Or add it directly in Xcode:
1. File → Add Package Dependencies
2. Enter the repository URL
3. Select the version and add to your target

## Usage

### Basic Setup

1. Import the package in your UIKit view controller:

```swift
import AppSceneStorageMacro
```

2. Add the `@UIKitSceneStorage` macro to your view controller class:

```swift
@UIKitSceneStorage
class MyViewController: UIViewController {
    // Your view controller implementation
}
```

3. Use `@SceneStorageKey` for properties you want to persist:

```swift
@UIKitSceneStorage
class MyViewController: UIViewController {
    
    @SceneStorageKey("user_age", defaultValue: 24)
    var age: Int
    
    @SceneStorageKey("user_name")
    var name: String?
    
    @SceneStorageKey("is_logged_in", defaultValue: false)
    var isLoggedIn: Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Access stored values
        print("User age: \(age)")
        print("User name: \(name ?? "Unknown")")
        print("Logged in: \(isLoggedIn)")
        
        // Update values (automatically persisted)
        age = 25
        name = "John Doe"
        isLoggedIn = true
    }
}
```

### Advanced Usage

#### Custom Scene Storage

You can also create custom scene storage instances:

```swift
class CustomViewController: UIViewController {
    
    private var sceneStorage: AppSceneStorage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize with current view controller
        sceneStorage = AppSceneStorage(self)
        
        // Or initialize with specific scene
        if let scene = view.window?.windowScene {
            sceneStorage = AppSceneStorage(scene)
        }
    }
    
    func saveUserPreference(_ value: String, forKey key: String) {
        sceneStorage?.set(value, forKey: key)
    }
    
    func getUserPreference(forKey key: String) -> String? {
        return sceneStorage?.string(forKey: key)
    }
}
```

#### Working with Different Data Types

The framework supports various data types:

```swift
@UIKitSceneStorage
class DataViewController: UIViewController {
    
    @SceneStorageKey("user_score", defaultValue: 0.0)
    var score: Double
    
    @SceneStorageKey("user_avatar")
    var avatarData: Data?
    
    @SceneStorageKey("user_settings")
    var settings: [String: Any]?
    
    @SceneStorageKey("user_urls")
    var urls: [URL]?
}
```

## API Reference

### AppSceneStorage

The core storage class that manages scene-level data persistence.

#### Initialization

```swift
// Initialize with scene ID
let storage = AppSceneStorage(sceneID: "unique_scene_id")

// Initialize with UIScene
let storage = AppSceneStorage(scene)

// Initialize with UIView
let storage = AppSceneStorage(view)

// Initialize with UIViewController
let storage = AppSceneStorage(viewController)
```

#### Data Access Methods

```swift
// Basic operations
storage.set(value, forKey: "key")
storage.object(forKey: "key")
storage.removeObject(forKey: "key")

// Type-specific getters
storage.string(forKey: "key")
storage.integer(forKey: "key")
storage.bool(forKey: "key")
storage.double(forKey: "key")
storage.url(forKey: "key")
storage.data(forKey: "key")
storage.array(forKey: "key")
storage.dictionary(forKey: "key")
```

### Macros

#### @UIKitSceneStorage

Automatically adds a scene storage instance to your view controller.

**Requirements:**
- Must be applied to a class that inherits from `UIViewController` or `UIView`
- Automatically creates a `_$sceneStorage` property

#### @SceneStorageKey

Creates computed properties with automatic getter/setter for scene storage.

**Parameters:**
- `key`: The storage key (required)
- `defaultValue`: Optional default value for the property

**Supported Types:**
- `Int`, `Float`, `Double`, `Bool`, `String`
- `URL`, `Data`, `[Any]`, `[String: Any]`

## How It Works

1. **Scene Identification**: Each UIScene gets a unique persistent identifier
2. **Data Isolation**: Data is stored with scene-specific keys to prevent conflicts
3. **Fallback Strategy**: If scene-specific data isn't available, falls back to standard UserDefaults
4. **Automatic Persistence**: Changes are automatically saved to persistent storage
5. **Type Safety**: Compile-time type checking ensures data consistency

## Data Persistence Strategy

The framework uses a two-tier storage approach:

1. **Scene-Specific Storage**: Uses `UserDefaults(suiteName: sceneID)` for scene isolation
2. **Global Fallback**: Falls back to `UserDefaults.standard` when scene data isn't available
3. **Key Prefixing**: Automatically prefixes keys with "Scene_" to avoid conflicts

## Best Practices

- Use descriptive keys that won't conflict with other parts of your app
- Provide meaningful default values for required properties
- Consider the lifecycle of your scenes when designing data persistence
- Use the macro system for simple cases, custom initialization for complex scenarios
- Test your scene storage implementation across different app states

## Examples

Check out the `AppSceneStorageMacroClient` target for a complete working example.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms specified in the LICENSE file.

## Support

If you encounter any issues or have questions, please open an issue on GitHub.