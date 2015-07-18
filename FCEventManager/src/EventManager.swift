//
//  EventManager.swift
//  FCEventManager
//
//  Created by Fabian Celdeiro on 7/4/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import Foundation


public class EventManager<T> {
  
  private let handlerMapTable  = NSMapTable(keyOptions: NSPointerFunctionsWeakMemory | NSPointerFunctionsObjectPointerPersonality, valueOptions: NSPointerFunctionsStrongMemory)
  
  public init(){
    
  }

  
  public func addListener(owner:NSObjectProtocol, evaluation:(event:T)->Bool,callback:(event:T)->Void) ->EventCallback<T>{
    
    //Callback may not be needed
    let handler = EventCallback<T>(evaluation: evaluation, callback: callback)
    
    if  (handlerMapTable.objectForKey(owner) != nil){
      if let handlers:NSMutableArray = handlerMapTable.objectForKey(owner) as? NSMutableArray{
        
        handlers.addObject(handler)
      }
    }
    else{
      handlerMapTable.setObject(NSMutableArray(object: handler), forKey: owner)
    }
    
  
    return handler
    
  }
  
  public func removeHandler(handler:EventCallback<T>){
    
    var allObjects:Array = handlerMapTable.keyEnumerator().allObjects
    
    for var i=allObjects.count-1 ; i>=0 ; i-- {
      
      let owner: NSObjectProtocol = allObjects[i] as! NSObjectProtocol
      
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
  //  println(handlerMapTable)
    
  }
  
  public func triggerEvent(newEvent:T){
    
    /// Checking all handlers
    
    /*
    println("")
    println("Triggering event:");
    println(newEvent)
    println("")
    */
    
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
