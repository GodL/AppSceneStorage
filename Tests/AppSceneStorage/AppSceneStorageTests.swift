import Testing
import Foundation
@testable import AppSceneStorage

@Suite("App Scene Storage Test")
struct AppSceneStorageTests {
  
  let storage1 = AppSceneStorage(sceneID: "storage1")
  
  let storage2 = AppSceneStorage(sceneID: "storage2")
  
  @Test
  func testObject() {
    let key = UUID().uuidString
    let value: Any? = UUID().uuidString
    storage1.set(value, forKey: key)
    #expect(storage1.object(forKey: key) != nil)
    #expect(storage2.object(forKey: key) != nil)
    
    storage2.set(value, forKey: key)
    storage1.removeObject(forKey: key)
    #expect(storage1.object(forKey: key) == nil)
    #expect(storage2.object(forKey: key) != nil)
  }
  
  @Test
  func testString() {
    let key = UUID().uuidString
    let value = UUID().uuidString
    storage1.set(value, forKey: key)
    #expect(storage1.string(forKey: key) == value)
    #expect(storage2.string(forKey: key) == value)
    let value2 = UUID().uuidString
    storage2.set(value2, forKey: key)
    #expect(storage1.string(forKey: key) == value)
    #expect(storage2.string(forKey: key) == value2)
  }
  
  @Test
  func testArray() {
    let key = UUID().uuidString
    let value = [UUID().uuidString, UUID().uuidString]
    storage1.set(value, forKey: key)
    #expect(storage1.array(forKey: key) as! [String] == value)
    #expect(storage2.array(forKey: key) as! [String] == value)
    let value2 = [UUID().uuidString, UUID().uuidString]
    storage2.set(value2, forKey: key)
    #expect(storage1.array(forKey: key) as! [String] == value)
    #expect(storage2.array(forKey: key) as! [String] == value2)
  }
  
  @Test
  func testDictionary() {
    let key = UUID().uuidString
    let value = [
      UUID().uuidString : UUID().uuidString,
      UUID().uuidString : UUID().uuidString,
    ]
    storage1.set(value, forKey: key)
    #expect(storage1.dictionary(forKey: key) as! [String : String] == value)
    #expect(storage2.dictionary(forKey: key) as! [String : String] == value)
    let value2 = [
      UUID().uuidString : UUID().uuidString,
      UUID().uuidString : UUID().uuidString,
    ]
    storage2.set(value2, forKey: key)
    #expect(storage1.dictionary(forKey: key) as! [String : String] == value)
    #expect(storage2.dictionary(forKey: key) as! [String : String] == value2)
  }
  
  @Test
  func testData() {
    let key = UUID().uuidString
    let value = UUID().uuidString.data(using: .utf8)!
    storage1.set(value, forKey: key)
    #expect(storage1.data(forKey: key) == value)
    #expect(storage2.data(forKey: key) == value)
    let value2 = UUID().uuidString.data(using: .utf8)!
    storage2.set(value2, forKey: key)
    #expect(storage1.data(forKey: key) == value)
    #expect(storage2.data(forKey: key) == value2)
  }
  
  @Test
  func testStringArray() {
    let key = UUID().uuidString
    let value = [
      UUID().uuidString,
      UUID().uuidString
    ]
    storage1.set(value, forKey: key)
    #expect(storage1.stringArray(forKey: key) == value)
    #expect(storage2.stringArray(forKey: key) == value)
    let value2 = [
      UUID().uuidString,
      UUID().uuidString
    ]
    storage2.set(value2, forKey: key)
    #expect(storage1.stringArray(forKey: key) == value)
    #expect(storage2.stringArray(forKey: key) == value2)
  }
  
  @Test
  func testInt() {
    let key = UUID().uuidString
    let value = UUID().uuidString.hashValue
    storage1.set(value, forKey: key)
    #expect(storage1.integer(forKey: key) == value)
    #expect(storage2.integer(forKey: key) == value)
    let value2 = UUID().uuidString.hashValue
    storage2.set(value2, forKey: key)
    #expect(storage1.integer(forKey: key) == value)
    #expect(storage2.integer(forKey: key) == value2)
  }
  
  @Test
  func testFloat() {
    let key = UUID().uuidString
    let value = Float(UUID().uuidString.hashValue)
    storage1.set(value, forKey: key)
    #expect(storage1.float(forKey: key) == value)
    #expect(storage2.float(forKey: key) == value)
    let value2 = Float(UUID().uuidString.hashValue)
    storage2.set(value2, forKey: key)
    #expect(storage1.float(forKey: key) == value)
    #expect(storage2.float(forKey: key) == value2)
  }
  
  @Test
  func testDouble() {
    let key = UUID().uuidString
    let value = Double(UUID().uuidString.hashValue)
    storage1.set(value, forKey: key)
    #expect(storage1.double(forKey: key) == value)
    #expect(storage2.double(forKey: key) == value)
    let value2 = Double(UUID().uuidString.hashValue)
    storage2.set(value2, forKey: key)
    #expect(storage1.double(forKey: key) == value)
    #expect(storage2.double(forKey: key) == value2)
  }
  
  @Test
  func testBool() {
    let key = UUID().uuidString
    let value = false
    storage1.set(value, forKey: key)
    #expect(storage1.bool(forKey: key) == value)
    #expect(storage2.bool(forKey: key) == value)
    let value2 = true
    storage2.set(value2, forKey: key)
    #expect(storage1.bool(forKey: key) == value)
    #expect(storage2.bool(forKey: key) == value2)
  }
}
