
final public class GhostManager:NSObject {
    
    // SINGLETON
    public static let getInstance = GhostManager()
    
    private override init(){
    }
    
    
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
    
    public func remove(_ type: String, object: AnyObject!, selector: Selector!) {
        let (success, index) = check(type, object: object, selector: selector)
        if success {
            handlers[type]!.remove(at: index)
        }
    }
    
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

    public func has(_ type:String, object: AnyObject!, selector: Selector!) -> Bool {
        return check(type, object: object, selector: selector).0
    }
}







