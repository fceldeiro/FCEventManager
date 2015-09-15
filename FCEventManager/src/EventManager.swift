//
//  EventManager.swift
//  FCEventManager
//
//  Created by Fabian Celdeiro on 7/4/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import Foundation


public class EventManager<T> {
  
  private let handlerMapTable  = NSMapTable(keyOptions: [NSPointerFunctionsOptions.WeakMemory, NSPointerFunctionsOptions.ObjectPointerPersonality], valueOptions: NSPointerFunctionsOptions.StrongMemory)
  
  public init(){
    
  }

  
  public func addListener(owner:NSObjectProtocol, evaluation:(event:T)->Bool,callback:(event:T)->Void) ->EventCallback<T>{
    
    //Callback may not be needed
    let handler = EventCallback<T>(evaluation: evaluation, callback: callback)
<<<<<<< HEAD
    
    
    //How many do i have before executing all
    if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray {
      print("Handlers count before \(handlers.count)")
    }
    else{
      print("no handlers")
    }
    
=======
>>>>>>> master
    
    if  (handlerMapTable.objectForKey(owner) != nil){
      if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray{
        
        handlers.addObject(handler)
      }
    }
    else{
      handlerMapTable.setObject(NSMutableArray(object: handler), forKey: owner)
    }
    
<<<<<<< HEAD
    //How many do i have after doing my logic
    if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray {
      print("Handlers count after \(handlers.count)")
    }
    
=======
  
>>>>>>> master
    return handler
    
  }
  
  public func removeHandler(handler:EventCallback<T>){
    
    var allObjects:Array = handlerMapTable.keyEnumerator().allObjects
    
    for var i=allObjects.count-1 ; i>=0 ; i-- {
      
<<<<<<< HEAD
      let owner: NSObject = allObjects[i] as! NSObject
=======
      let owner: NSObjectProtocol = allObjects[i] as! NSObjectProtocol
>>>>>>> master
      
      if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray {
        for var j=handlers.count-1 ; j>=0 ; j-- {
          let handlerInCollection = handlers[j] as! EventCallback<T>
          if (handler === handlerInCollection){
            handlers.removeObjectAtIndex(j)
          }
        }
        
        if handlers.count <= 0 {
          handlerMapTable.removeObjectForKey(owner)
        }
      }
    }
  }
  
  public func removeListener(owner:NSObjectProtocol){
    
    handlerMapTable.removeObjectForKey(owner)
<<<<<<< HEAD
    print(handlerMapTable)
=======
  //  println(handlerMapTable)
>>>>>>> master
    
  }
  
  public func triggerEvent(newEvent:T){
    
    /// Checking all handlers
<<<<<<< HEAD
    print("")
    print("Triggering event:");
    print(newEvent)
    print("")
=======
    
    /*
    println("")
    println("Triggering event:");
    println(newEvent)
    println("")
    */
>>>>>>> master
    
    let allObjects:NSArray = handlerMapTable.keyEnumerator().allObjects
    
    for key in allObjects{
      if let handlerArray:NSMutableArray = handlerMapTable.objectForKey(key) as? NSMutableArray{
        for  var index = 0 ; index < handlerArray.count ; ++index{
          if let handler:EventCallback<T> = handlerArray[index] as? EventCallback{
            if handler.evaluation(event: newEvent){
              handler.callback(event: newEvent)
            }
          }
        }
      }
    }
  }
}
