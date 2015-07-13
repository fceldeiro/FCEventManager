//
//  EventCallback.swift
//  FCEventManager
//
//  Created by Fabian Celdeiro on 7/4/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import Foundation

public class EventCallback<T>  : NSObject {
  
  let evaluation : (event:T) -> Bool
  let callback : (event:T) -> Void
  
  init (evaluation:(event:T) ->Bool, callback:(event:T)-> Void){
    self.evaluation = evaluation
    self.callback = callback
  }

}
