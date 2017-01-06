
import GhostEventCenter
import Foundation


class PinkyGhost:Ghost {
	// custom ghost class with extra properties
	static let Pinky = "This is Pinky"
	
	let color = "pink"
	var speed = "fast"
	
	init() {
		super.init(type: PinkyGhost.Pinky)
	}
}


class Listen {

	private let ghostMan = GhostManager.getInstance

	init() {
		// listen for events
		ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(callback1))
		ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(callback2))
        
        // add a bunch of listeners
        ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(ignored))
        ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(ignored))
        ghostMan.listen(PinkyGhost.Pinky, object: self, selector: #selector(ignored))
		
		// but will remove one, so only #2 will show
		ghostMan.remove(PinkyGhost.Pinky, object: self, selector: #selector(callback1))
        
        // remove the ignored ones - there were 3
        ghostMan.remove(PinkyGhost.Pinky, object: self, selector: #selector(ignored))
        ghostMan.remove(PinkyGhost.Pinky, object: self, selector: #selector(ignored))
        print(ghostMan.has(PinkyGhost.Pinky, object: self, selector: #selector(ignored)))
        ghostMan.remove(PinkyGhost.Pinky, object: self, selector: #selector(ignored))
        print(ghostMan.has(PinkyGhost.Pinky, object: self, selector: #selector(ignored)))
	}

	@objc private func callback1(obj:PinkyGhost){
		print("callback #1: \(obj.color)") // intellisense ftw!!!11
	}
	
	@objc private func callback2(obj:PinkyGhost){
		print("callback #2: \(obj.speed)") // slow
	}
    
    @objc private func ignored(obj:PinkyGhost){
        print("this is ignored")
    }
}


class Send {
	
	private let ghostMan = GhostManager.getInstance
	
	init() {
		// send custom event from different class/obj
		let ghost = PinkyGhost()
		ghost.speed = "slow"
		
		ghostMan.send(ghost)
	}
}


Listen()
Send ()


