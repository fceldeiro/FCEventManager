//
//  EventManagerViewController
//  FCEventManager
//
//  Created by Fabian Celdeiro on 7/4/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import UIKit

class EventManagerViewController: UIViewController {
  
  @IBOutlet weak var labelResult: UILabel!
  let eventManager  = EventManager<CustomEvent>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    addListeners()
    launchCustomEvents()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onButtonStopListeningPressed(sender: UIButton) {
    eventManager.removeListener(self)
  }
  @IBAction func onButtonStartListeningPressed(sender: UIButton) {
    addListeners()
  }
  @IBAction func onButtonClearPressed(sender: UIButton) {
    labelResult.text = ""
  }
  @IBAction func onButtonEmitNewEventPressed(sender: UIButton) {
    let eventText = CustomEvent(identifier: "xxx-test", from: "me", to: "she")
    eventManager.triggerEvent(eventText)
    
  }
  
  func launchCustomEvents(){
    
    let eventText = CustomEvent(identifier: "xxx-test", from: "me", to: "she")
    let eventImage = CustomEvent(identifier: "xxx-test-image", from: "me", to: "she")
    
    eventManager.triggerEvent(eventText)
    eventManager.triggerEvent(eventImage)
    
    
  }
  func addListeners(){
    
    var handlers = [EventCallback<CustomEvent>]()
    
    weak var weakSelf = self
    
    handlers.append(eventManager.addListener(self , evaluation: { (event:CustomEvent) -> Bool in
      
      return event.from == "me"
      
      }, callback: { (event:CustomEvent) -> Void in
        
        if let weakSelfUnwrapped = weakSelf{
          weakSelfUnwrapped.labelResult.text = event.from
        }
        print("Event from me arrived")
    }))
    
    
    
    handlers.append(eventManager.addListener(self, evaluation: { (event:CustomEvent) -> Bool in
      return event.from == "she"
      }, callback: { (event:CustomEvent) -> Void in
        print("Event from shearrived")
    }))
    

    
  }
  
  deinit{
    self.eventManager .removeListener(self)
  }
  
  
}

