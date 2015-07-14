//
//  FCEventManagerTests.swift
//  FCEventManagerTests
//
//  Created by Fabian Celdeiro on 7/12/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import UIKit
import XCTest
import FCEventManager

class FCEventManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testEquality (){
    
    class CustomObject : NSObject{
      var string : String;
      
      init(string:String){
        self.string = string
      }
      
      override func  isEqual(object: AnyObject?) -> Bool {
        var target = object! as! CustomObject
        return target.string == self.string
      
      }
      
      override var hash:NSInteger{
        get{
          return self.string.hash
        }
      }
    }
    
    var eventManager = EventManager<CustomObject>()
    
    var customObjectA = CustomObject(string: "A")
    var customObjectB = CustomObject(string: "A")
    
    let isEqual = customObjectA.isEqual(customObjectB)
    let isHashEqual = customObjectA.hash == customObjectB.hash
    
    var handlerMapTable  = NSMapTable(keyOptions: NSPointerFunctionsWeakMemory  , valueOptions: NSPointerFunctionsStrongMemory)
    
    handlerMapTable.setObject("A", forKey: customObjectA)
    println(handlerMapTable.count)
    handlerMapTable.setObject("B", forKey: customObjectB)
    println(handlerMapTable.count)

    
  }
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
