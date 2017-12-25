import UIKit
import PlaygroundSupport

//:## Animatable Properties
/*:
	* frames
	* bounds
	* center
	* transform
	* alpha
	* backgroundColor
*/
//:## Frames VS Bounds
// Frame: coordinates of view relative to its superview's 0,0. Its size is the smallest upright rectangle that can contain the entirity of the view, despite it possibly being rotated
// Bounds: coordinates of view within itself. Despite the view being possibly rotated, in terms of bounds, content of the view is always upright, and upper left corner is 0,0
//:## animate withDuration
let view = UIView()

UIView.animate(withDuration: 2) {
	view.alpha = 0.3
}

// Define a frame and then init a UIView from frame
let liveViewFrame = CGRect(x: 0, y: 0, width: 300, height: 300)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView

// Same here, then add it as subview to liveView
let squareFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: squareFrame)
square.backgroundColor = .purple
liveView.addSubview(square)

/*:

	UIView.animate(withDuration: 3) {
		square.backgroundColor = .orange
		square.center = liveView.center
	}
*/

//:## animate withDuration options
// Method with completion handler
UIView.animate(withDuration: 3, animations: {
	// put animation here
}) { (_) in
	// execute only after the animation
}

// Method with options
UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse], animations: {
	// delay here means initial delay before the animation
	square.backgroundColor = .orange
	square.alpha = 0.5
	square.center = liveView.center
//	square.frame = CGRect(x: 200, y: 0, width: 100, height: 100)
})

// If a delay is needed in between parts of the animation, use UIView.addKeyframeWithRelativeStartTime
//:## Transform
// 3 types: Scale, rotate and translate (move)
let scaleTransform = CGAffineTransform(scaleX: 0.8, y: 0.8)
// rotatation in radian, positive is counterclockwise
let rotateTransform = CGAffineTransform(rotationAngle: .pi)
let translateTransform = CGAffineTransform(translationX: 100, y: 100)
let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
UIView.animate(withDuration: 2, animations: {
	square.transform = comboTransform
}) { (_) in
	UIView.animate(withDuration: 2, animations: {
		square.transform = CGAffineTransform.identity
	})
}
// Use CGAffineTransform.identity to undo all transformation
