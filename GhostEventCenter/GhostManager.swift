
public class GhostManager:NSObject {

	// SINGLETON
	public static let getInstance = GhostManager()

	private override init(){
	}
	
	
	private var handlers = [ String : [ GhostVO ]]()
	
	public func listen(type: String, object: AnyObject!, selector: Selector!) {
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
	
	public func removeAllOfType (type:String!){
		handlers.removeValueForKey(type)
	}

	public func remove(type: String, object: AnyObject!, selector: Selector!) {
		if let array = handlers[type] {
			for counter in array.count.stride(through: 1, by: -1) {
				let index = counter - 1
				if array[index].id == "\(ObjectIdentifier(object).uintValue):\(selector)" {
					handlers[type]!.removeAtIndex(index)
					break
				}
			}
		}
	}

	public func send(event: Ghost!) {
		if let array = handlers[event.type] {
			for handler in array {
				if handler.object != nil {
					handler.object!.performSelector(handler.selector, withObject: event)
				}
//				else {
//					remove(event.type, object: handler.object, selector: handler.selector)
//				}
			}
		}
	}
}







