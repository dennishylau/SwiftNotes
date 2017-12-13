import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
	
	@IBOutlet weak var imageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
		let photoURL = documentsDirectory.appendingPathComponent("photo.jpg")
		imageView.image = UIImage(contentsOfFile: photoURL.path) ?? #imageLiteral(resourceName: "fire")
	}
//:## UIActivityViewControlelr
	// The sharing popup

	@IBAction func shareButtonTapped(_ sender: UIButton) {
		guard let image = imageView.image else {return}
		let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
		activityController.popoverPresentationController?.sourceView = sender
		// only for ipad, popover emante and points to the calling button
		present(activityController, animated: true, completion: nil)
	}

//:## SFSafariViewController

	@IBAction func safariButtonTapped(_ sender: Any) {
		guard let url = URL(string: "http://resbo.com.hk") else {return}
		let safariViewController = SFSafariViewController(url: url)
		present(safariViewController, animated: true, completion: nil)
	}

//:## UIImagePickerControllerDelegate

	@IBAction func cameraButtonTapped(_ sender: UIButton) {
		// VC adopt potocols
		// UIImagePickerControllerDelegate: pass in image pinking data
		// UINavigationControllerDelegate: control navigation stack behaviour
		
		// Also need to set the NSPhotoLibraryUsageDescription and the NSCameraUsageDescription keys in info.plist for permission
		
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self				// delegate receives notif of image-picking & controls dismiss of picker

		// Title and style of alert
		let alertController = UIAlertController(title: "Choose Image Source", message: "Pick from...?", preferredStyle: .actionSheet)
		alertController.popoverPresentationController?.sourceView = sender

		// Add camera button
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
				imagePicker.sourceType = .camera
				self.present(imagePicker, animated: true, completion: nil)
				print("User selected Camera")
			}
			alertController.addAction(cameraAction)
		}

		// Add photo library button
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			let photolibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
				imagePicker.sourceType = .photoLibrary
				self.present(imagePicker, animated: true, completion: nil)
			}
			alertController.addAction(photolibraryAction)
		}
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		present(alertController, animated: true, completion: nil)
	}

	
	// Call delegate method to auto dismiss picker and save to path
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
		let photoURL = documentsDirectory.appendingPathComponent("photo.jpg")
		
		guard let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
		imageView.image = selectedPhoto
		dismiss(animated: true, completion: nil)
		if let data = UIImageJPEGRepresentation(selectedPhoto, 1) {
			try? data.write(to: photoURL)
		}
	}
	
//:## MFMailComposeViewControllerDelegate
	@IBAction func emailButtonTapped(_ sender: Any) {
		
		if MFMailComposeViewController.canSendMail() {
			guard let imageData = imageView.image, let data = UIImageJPEGRepresentation(imageData,1) else {return}
			let mailComposer = MFMailComposeViewController()
			mailComposer.mailComposeDelegate = self
			mailComposer.setToRecipients(["dennishylau@gmail.com"])
			mailComposer.setSubject("Nice Photo")
			mailComposer.setMessageBody("Hello World.", isHTML: false)
			mailComposer.addAttachmentData(data, mimeType: "image/jpeg", fileName: "photo.jpg")
		} else {
			let alertController = UIAlertController(title: "Can't Send Email", message: "System mail service not set up.", preferredStyle: .alert)
			let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
			alertController.addAction(cancelAction)
			present(alertController, animated: true, completion: {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
					alertController.dismiss(animated: true, completion: nil)
				}
			})
		}
	}
	
	// Call delegate method to auto dismiss composer
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		dismiss(animated: true, completion: nil)
	}
}
