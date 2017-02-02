
public protocol Boo {
    var type:String { get }
}


open class Ghost:NSObject, Boo {
    
    private var _type:String
    
    public var type:String {
        return _type
    }
    
    public init(type:String) {
        self._type = type
    }
}




