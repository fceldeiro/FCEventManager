# FCEventManager
Library listen for custom events with very little effort.


Create a custom event class.
```
class CustomEvent : NSObject {

var from : String?
var to : String?
var identifier :String?

init(identifier:String, from:String,to:String){

self.from = from
self.to = to
self.identifier = identifier;

}

```


Now you can use it with the EventManager

```
let eventManager  = EventManager<CustomEvent>()
eventManager.addListener(self , evaluation: { (event:CustomEvent) -> Bool in
return event.from == "me"
}, callback: { (event:CustomEvent) -> Void in
println("Event from me arrived")
})

var eventText = CustomEvent(identifier: "xxx-test", from: "me", to: "she")
eventManager.triggerEvent(eventText)
```
