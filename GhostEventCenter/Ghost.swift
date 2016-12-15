
open class Ghost:NSObject {
	
	fileprivate var _type:String
	
	open var type:String {
		return _type
	}
	
	public init(type:String) {
		self._type = type
	}
}




