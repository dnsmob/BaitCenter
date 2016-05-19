
import GhostEventCenter
import Foundation


class PinkyGhost:Ghost {
	
	static let Pinky = "This is Pinky"
	
	let color = "pink"
	let speed = "fast"
	
	init() {
		super.init(type: PinkyGhost.Pinky)
	}
}


class Demo {

	private let ghostMan = GhostManager.getInstance

	init() {
		ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(callback1))
		ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(callback2))
		ghostMan.send(PinkyGhost())
		
		ghostMan.remove(PinkyGhost.Pinky, object: self, selector: #selector(callback1))
		ghostMan.send(PinkyGhost())
	}

	@objc private func callback1(obj:PinkyGhost!){
		print("callback #1 \(obj.color)")
	}
	
	@objc private func callback2(obj:PinkyGhost!){
		print("callback #2 \(obj.speed)")
	}
}

Demo()