// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation


public struct AppSceneStorage {
  
  public let sceneID: String
  
  let _sceneDefaults: UserDefaults?
  
  @usableFromInline
  var standard: UserDefaults {
    .standard
  }

  public init(sceneID: String) {
    self.sceneID = sceneID
    self._sceneDefaults = UserDefaults(suiteName: sceneID)
  }
  
  @usableFromInline
  func _sceneKey(for defaultKey: String) -> String {
    "Scene_\(defaultKey)"
  }
}

public extension AppSceneStorage {
  
  func register(_ value: Any, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.register(defaults: [key : value])
  }
  
  func object(forKey defaultName: String) -> Any? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.object(forKey: key) ?? standard.object(forKey: key)
  }
  
  func set(_ value: Any?, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.set(value, forKey: key)
    standard.set(value, forKey: key)
  }

  func removeObject(forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.removeObject(forKey: key)
    standard.removeObject(forKey: key)
  }
  
  func string(forKey defaultName: String) -> String? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.string(forKey: key) ?? standard.string(forKey: key)
  }
  
  func array(forKey defaultName: String) -> [Any]? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.array(forKey: key) ?? standard.array(forKey: key)
  }
  
  func dictionary(forKey defaultName: String) -> [String : Any]? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.dictionary(forKey: key) ?? standard.dictionary(forKey: key)
  }
  
  func data(forKey defaultName: String) -> Data? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.data(forKey: key) ?? standard.data(forKey: key)
  }
  
  func stringArray(forKey defaultName: String) -> [String]? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.stringArray(forKey: key) ?? standard.stringArray(forKey: key)
  }
  
  func integer(forKey defaultName: String) -> Int {
    let key = _sceneKey(for: defaultName)
    if _sceneDefaults?.object(forKey: key) != nil {
      return _sceneDefaults?.integer(forKey: key) ?? standard.integer(forKey: key)
    }
    return standard.integer(forKey: key)
  }
  
  func float(forKey defaultName: String) -> Float {
    let key = _sceneKey(for: defaultName)
    if _sceneDefaults?.object(forKey: key) != nil {
      return _sceneDefaults?.float(forKey: key) ?? standard.float(forKey: key)
    }
    return standard.float(forKey: key)
  }
  
  func double(forKey defaultName: String) -> Double {
    let key = _sceneKey(for: defaultName)
    if _sceneDefaults?.object(forKey: key) != nil {
      return _sceneDefaults?.double(forKey: key) ?? standard.double(forKey: key)
    }
    return standard.double(forKey: key)
  }
  
  func bool(forKey defaultName: String) -> Bool {
    let key = _sceneKey(for: defaultName)
    if _sceneDefaults?.bool(forKey: key) != nil {
      return _sceneDefaults?.bool(forKey: key) ?? standard.bool(forKey: key)
    }
    return standard.bool(forKey: key)
  }
  
  func url(forKey defaultName: String) -> URL? {
    let key = _sceneKey(for: defaultName)
    return _sceneDefaults?.url(forKey: key) ?? standard.url(forKey: key)
  }
  
  func set(_ value: Int, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.set(value, forKey: key)
    standard.set(value, forKey: key)
  }
  
  func set(_ value: Float, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.set(value, forKey: key)
    standard.set(value, forKey: key)
  }
  
  func set(_ value: Double, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.set(value, forKey: key)
    standard.set(value, forKey: key)
  }
  
  func set(_ value: Bool, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.set(value, forKey: key)
    standard.set(value, forKey: key)
  }
  
  func set(_ url: URL?, forKey defaultName: String) {
    let key = _sceneKey(for: defaultName)
    _sceneDefaults?.set(url, forKey: key)
    standard.set(url, forKey: key)
  }
}

