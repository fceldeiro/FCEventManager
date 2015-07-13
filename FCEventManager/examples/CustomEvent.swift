//
//  CustomEvent
//  FCEventManager
//
//  Created by Fabian Celdeiro on 7/4/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import Foundation

class CustomEvent : NSObject {
  
  var from : String?
  var to : String?
  var identifier :String?
  
  init(identifier:String, from:String,to:String){
    
    self.from = from
    self.to = to
    self.identifier = identifier;
  
  }
  
  override var description : String {
    get {
      
      var desc = String()
      
      if let from = self.from{
        desc += "from:\(from) ,"
      }
      
      if let to = self.to{
        desc += "\nto:\(to) ,"
      }
      
      if let identifier = self.identifier{
        desc += "\nidentifier:\(identifier) ,"
      }
      
      return desc
    }
  }
  
}
