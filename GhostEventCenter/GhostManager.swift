
public class GhostManager {
    
    // SINGLETON
    public static let getInstance = GhostManager()
    
    private init(){
    }
    
    private var selectors = [[ String : NSMutableDictionary ]]()
    
    public func listen(_ type: String, object: AnyObject, selector: Selector) {
        let dict = NSMutableDictionary()
        dict.setValue(object, forKey: "object")
        dict.setValue(selector, forKey: "selector")
        selectors.append([ type : dict ])
    }
    
    public func send(_ event: Ghost) {
        for dict in selectors {
            let key = dict.keys.first!
            if event.type == key {
                let object = dict[key]!.value(forKey: "object")! as AnyObject
                let selector = dict[key]!.value(forKey:"selector")! as! Selector
                let _ = object.perform(selector, with: event)
            }
        }
    }
    
    public func remove(_ type: String, object: AnyObject, selector: Selector) {
        let (success, index) = check(type, object: object, selector: selector)
        if success {
            selectors.remove(at: index)
        }
    }
    
    public func removeAll() {
        selectors = []
    }
    
    public func removeAllOfType (_ type:String){
        for counter in stride(from: selectors.count, through: 1, by: -1) {
            let index = counter - 1
            let dict = selectors[index]
            let key = dict.keys.first!
            if type == key {
                selectors.remove(at: index)
            }
        }
    }
    
    private func check(_ type:String, object: AnyObject, selector: Selector) -> (Bool, Int) {
        for counter in stride(from: selectors.count, through: 1, by: -1) {
            let index = counter - 1
            let dict = selectors[index]
            let key = dict.keys.first!
            if type == key {
                if dict[key]!.value(forKey: "object") as AnyObject === object {
                    if dict[key]!.value(forKey: "selector") as! Selector == selector {
                        return (true, index)
                    }
                }
            }
        }
        return (false, 0)
    }
    
    public func has(_ type:String, object: AnyObject, selector: Selector) -> Bool {
        return check(type, object: object, selector: selector).0
    }
}





