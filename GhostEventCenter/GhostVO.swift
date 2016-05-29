
import Foundation

internal class GhostVO:NSObject {
	
	private var _sel:Selector
	private unowned var _obj:AnyObject
	private var _id:String
	
	internal var selector:Selector {
		return _sel
	}
	
	internal var object:AnyObject {
		return _obj
	}
	
	internal var id:String {
		return _id
	}
	
	internal init (object:AnyObject, selector: Selector){
		self._obj = object
		self._sel = selector
		self._id = "\(ObjectIdentifier(object).uintValue):\(selector)"
	}
}