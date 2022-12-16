//
//  ViewController.swift
//  CustomPhotoLibrary
//
//  Created by 정현우 on 2022/12/16.
//

import UIKit
import Photos

class ViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	
	let imagePickerController = UIImagePickerController()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		imagePickerController.delegate = self
		
	}
	func configurePhotoLibraryAuthorization() {
		// iOS14 이후 접근 권한 변경 .readWrite와 .addOnly가 있음
		if #available(iOS 14, *) {
			switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
			case .notDetermined:
				// 아직 아무런 선택도 하지 않았을 때
				print("not determined")
				PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
					switch status {
					case .authorized, .limited:
						print("권한이 부여 됐습니다.")
						self.openPhotoLibrary()
					case .denied:
						print("권한이 거부 됐습니다.")
					default:
						print("unknown")
					}
				}
			case .restricted:
				print("restricted")
			case .denied:
				print("denined")
			case .authorized:
				print("autorized")
				openPhotoLibrary()
			case .limited:
				print("limited")
				openPhotoLibrary()
			@unknown default:
				print("unknown")
			}
			
		} else {
			switch PHPhotoLibrary.authorizationStatus() {
			case .notDetermined:
				print("not determined")
			case .restricted:
				print("restricted")
			case .denied:
				print("denined")
			case .authorized:
				print("autorized")
				openPhotoLibrary()
			default:
				print("unknown")
			}
			
		}
		
		
	}
	
	@IBAction func photoButtonTapped(_ sender: UIButton) {
		configurePhotoLibraryAuthorization()
	}
	
	func openPhotoLibrary() {
		imagePickerController.sourceType = .photoLibrary
		present(imagePickerController, animated: true)
	}
	
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			imageView.image = image
		}
		picker.dismiss(animated: true)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true)
	}
}

