
final public class GhostManager:NSObject {
    
    // SINGLETON
    public static let getInstance = GhostManager()
    
    private override init(){
    }
    
    
//    private var handlers = [ String : [ NSDictionary ]]()
//    
//    public func listen(_ type: String, obj: NSObject!, sel: Selector!) {
//        let event = NSDictionary()
//        event.setValue(obj, forKey: "obj")
//        event.setValue(sel, forKey: "sel")
//        event.setValue("\(UInt(bitPattern: ObjectIdentifier(obj))):\(sel)", forKey: "id")
//    
//        if handlers[type] != nil {
//            handlers[type]?.append(event)
//        }
//        else {
//            handlers[type] = [event]
//        }
//    }

    private var handlers = [ String : [ GhostVO ]]()
    
    public func listen(_ type: String, object: AnyObject!, selector: Selector!) {
        let event = GhostVO(object: object, selector: selector)
        
        if handlers[type] != nil {
            handlers[type]?.append(event)
        }
        else {
            handlers[type] = [event]
        }
    }
    
    public func removeAll() {
        handlers = [:];
    }
    
    public func removeAllOfType (_ type:String!){
        handlers.removeValue(forKey: type)
    }
    
//    public func remove(_ type: String, obj: AnyObject!, sel: Selector!) {
//        let (success, index) = check(type, obj: obj, sel: sel)
//        if success {
//            handlers[type]!.remove(at: index)
//        }
//    }

    public func remove(_ type: String, object: AnyObject!, selector: Selector!) {
        let (success, index) = check(type, object: object, selector: selector)
        if success {
            handlers[type]!.remove(at: index)
        }
    }

    //    public func send(_ event: Ghost!) {
    //        if let array = handlers[event.type] {
    //            for handler in array {
    //
    //                if let obj = handler.object(forKey: "obj") {
    //                    let _ = (obj as! NSObject).perform(handler.object(forKey: "sel") as! Selector, with: event)
    //                }
    //                //				else {
    //                //					remove(event.type, object: handler.object, selector: handler.selector)
    //                //				}
    //            }
    //        }
    //    }
    
    public func send(_ event: Ghost!) {
        if let array = handlers[event.type] {
            for handler in array {
                if handler.object != nil {
                    let _ = handler.object!.perform(handler.selector, with: event)
                }
                //				else {
                //					remove(event.type, object: handler.object, selector: handler.selector)
                //				}
            }
        }
    }
    
//    private func check(_ type:String, obj: AnyObject!, sel: Selector!) -> (Bool, Int) {
//        if let array = handlers[type] {
//            for counter in stride(from: array.count, through: 1, by: -1) {
//                let index = counter - 1
//                if array[index].object(forKey: "id") as! String == "\(UInt(bitPattern: ObjectIdentifier(obj))):\(sel)" {
//                    return (true, index)
//                }
//            }
//        }
//        return (false, 0)
//    }

    private func check(_ type:String, object: AnyObject!, selector: Selector!) -> (Bool, Int) {
        if let array = handlers[type] {
            for counter in stride(from: array.count, through: 1, by: -1) {
                let index = counter - 1
                if array[index].id == "\(UInt(bitPattern: ObjectIdentifier(object))):\(selector)" {
                    return (true, index)
                }
            }
        }
        return (false, 0)
    }

//    public func has(_ type:String, obj: AnyObject!, sel: Selector!) -> Bool {
//        return check(type, obj: obj, sel: sel).0
//    }
    
    public func has(_ type:String, object: AnyObject!, selector: Selector!) -> Bool {
        return check(type, object: object, selector: selector).0
    }
}







