
import XCTest
import GhostEventCenter

class Pinky:Ghost {
	// custom ghost class with extra properties
	static let Ghost = "This is Pinky"
	
	let color = "pink"
	var speed = "fast"
	
	init() {
		super.init(type: Pinky.Ghost)
	}
}


class GhostEventCenterTests: XCTestCase {
	
	let man = GhostManager.getInstance
	var called1:Pinky?
	var called2:Pinky?
	
    override func setUp() {
        super.setUp()
	}

	// MARK: callbacks
	@objc private func callback1(_ obj:Pinky!){
		print(obj.speed)
		called1 = obj
	}
	
	@objc private func callback2(_ obj:Pinky!){
		print(obj.speed)
		called2 = obj
	}
	
	// MARK: tests
	func testNotificationExists(){
		XCTAssertNotNil(Pinky())
	}
    
	func testSendUnmodifiedNotification (){
		man.listen(Pinky.Ghost, object: self, selector: #selector(callback1))
		
		let ghost = Pinky()
		man.send(ghost)
		
		XCTAssertNotNil(called1)
		XCTAssertEqual(ghost, called1)
		
		man.removeAll() // cleanup notification center
	}
	
	func testSendModifiedNotification(){
		man.listen(Pinky.Ghost, object: self, selector: #selector(callback2))
		
		let ghost = Pinky()
		ghost.speed = "slow"
		man.send(ghost)
		
		XCTAssertNotNil(called2)
		XCTAssertNotEqual(called1, called2) // called1.speed = "fast" , called2.speed = "slow"
		
		man.removeAll()
	}
	
	
}
