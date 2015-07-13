//
//  EventManager.swift
//  FCEventManager
//
//  Created by Fabian Celdeiro on 7/4/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import Foundation


class EventManager<T> {
  
  private let handlerMapTable  = NSMapTable(keyOptions: NSPointerFunctionsWeakMemory, valueOptions: NSPointerFunctionsStrongMemory)
  
  
  func addListener(owner:NSObject, evaluation:(event:T)->Bool,callback:(event:T)->Void) ->EventCallback<T>{
    
    //Callback may not be needed
    var handler = EventCallback<T>(evaluation: evaluation, callback: callback)
    
    
    //How many do i have before executing all
    if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray {
      println("Handlers count before \(handlers.count)")
    }
    else{
      println("no handlers")
    }
    
    
    //new
    if  (handlerMapTable.objectForKey(owner) != nil){
      if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray{
        
        handlers.addObject(handler)
      }
    }
    else{
      handlerMapTable.setObject(NSMutableArray(object: handler), forKey: owner)
    }
    
    //How many do i have after doing my logic
    if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray {
      println("Handlers count after \(handlers.count)")
    }
    
    return handler
    
  }
  
  func removeHandler(handler:EventCallback<T>){
    
    var allObjects:Array = handlerMapTable.keyEnumerator().allObjects
    
    for var i=allObjects.count-1 ; i>=0 ; i-- {
      
      var owner: NSObject = allObjects[i] as! NSObject
      
      if var handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray {
        for var j=handlers.count-1 ; j>=0 ; j-- {
          var handlerInCollection = handlers[j] as! EventCallback<T>
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
  
  func removeListener(owner:NSObject){
    
    handlerMapTable.removeObjectForKey(owner)
    println(handlerMapTable)
    
  }
  
  func triggerEvent(newEvent:T){
    
    /// Checking all handlers
    println("")
    println("Triggering event:");
    println(newEvent)
    println("")
    
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