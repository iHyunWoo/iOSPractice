//
//  RegisterViewController.swift
//  Messenger
//
//  Created by 정현우 on 2023/01/01.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
	
	
	
	private let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.clipsToBounds = true
		scrollView.isUserInteractionEnabled = true
		
		return scrollView
	}()
	
	private let logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "person")
		imageView.tintColor = .gray
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		imageView.layer.borderWidth = 2
		imageView.layer.borderColor = UIColor.lightGray.cgColor
		imageView.isUserInteractionEnabled = true
		
		return imageView
	}()
	
	private let firstNameTextField: UITextField = {
		let textField = UITextField()
		textField.autocapitalizationType = .none
		textField.autocorrectionType = .no
		textField.returnKeyType = .continue
		textField.layer.cornerRadius = 12
		textField.layer.borderWidth = 1
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.placeholder = "First Name..."
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.backgroundColor = .white
		
		return textField
	}()
	
	private let lastNameTextField: UITextField = {
		let textField = UITextField()
		textField.autocapitalizationType = .none
		textField.autocorrectionType = .no
		textField.returnKeyType = .continue
		textField.layer.cornerRadius = 12
		textField.layer.borderWidth = 1
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.placeholder = "Last Name..."
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.backgroundColor = .white
		
		return textField
	}()
	
	private let emailTextField: UITextField = {
		let textField = UITextField()
		textField.autocapitalizationType = .none
		textField.autocorrectionType = .no
		textField.returnKeyType = .continue
		textField.layer.cornerRadius = 12
		textField.layer.borderWidth = 1
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.placeholder = "Email Address..."
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.backgroundColor = .white
		
		return textField
	}()
	
	private let passwordTextField: UITextField = {
		let textField = UITextField()
		textField.autocapitalizationType = .none
		textField.autocorrectionType = .no
		textField.returnKeyType = .done
		textField.layer.cornerRadius = 12
		textField.layer.borderWidth = 1
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.placeholder = "Password..."
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.backgroundColor = .white
		textField.isSecureTextEntry = true
		
		return textField
	}()
	
	private let registerButton: UIButton = {
		let button = UIButton()
		button.setTitle("Register", for: .normal)
		button.backgroundColor = .systemGreen
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 12
		button.layer.masksToBounds = true
		button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
		
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Register"
		view.backgroundColor = .white

		configureViews()
		configureGesture()
		
		emailTextField.delegate = self
		passwordTextField.delegate = self
	}
	
}
// MARK: functions
extension RegisterViewController {
	private func configureViews() {
		view.addSubview(scrollView)
		scrollView.frame = view.bounds
		
		[firstNameTextField, lastNameTextField, logoImageView, emailTextField, passwordTextField, registerButton]
			.forEach {scrollView.addSubview($0)}
		
		let imageSize = scrollView.bounds.size.width/3
		logoImageView.layer.cornerRadius = imageSize / 2.0
		logoImageView.snp.makeConstraints {
			$0.width.equalTo(imageSize)
			$0.height.equalTo(imageSize)
			$0.top.equalToSuperview().inset(20)
			$0.centerX.equalToSuperview()
		}
		
		firstNameTextField.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(logoImageView.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
		}
		
		lastNameTextField.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(firstNameTextField.snp.bottom).offset(10)
			$0.centerX.equalToSuperview()
		}
		
		emailTextField.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(lastNameTextField.snp.bottom).offset(10)
			$0.centerX.equalToSuperview()
		}
		
		passwordTextField.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(emailTextField.snp.bottom).offset(10)
			$0.centerX.equalToSuperview()
		}
		
		registerButton.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(passwordTextField.snp.bottom).offset(10)
			$0.centerX.equalToSuperview()
		}
		
		
	}
	
	
	
	private func configureGesture() {
		registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
		
		let logoTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfileLogo))
		logoImageView.addGestureRecognizer(logoTapGesture)
	}
	
	private func alertUserLoginError() {
		let alert = UIAlertController(title: "Woops",
									  message: "Please enter all information to create a new account.",
									  preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
		present(alert, animated: true)
	}
	
	@objc private func didTapChangeProfileLogo() {
		presentPhotoActionSheet()
	}
	
	@objc private func didTapRegisterButton() {
		// 키보드가 내려감
		firstNameTextField.resignFirstResponder()
		lastNameTextField.resignFirstResponder()
		emailTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
		
		guard let firstName = firstNameTextField.text,
			  let lastName = lastNameTextField.text,
			  let email = emailTextField.text,
			  let password = passwordTextField.text,
			  !firstName.isEmpty,
			  !lastName.isEmpty,
			  !email.isEmpty,
			  !password.isEmpty,
			  password.count >= 6 else {
			alertUserLoginError()
			return
		}
		
		// Firebase Register
	}
}
// MARK: TextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == emailTextField {
			passwordTextField.becomeFirstResponder()
		} else if textField == passwordTextField {
			didTapRegisterButton()
		}
		
		return true
	}
}
// MARK: UIImagePickerControllerDelegate
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func presentPhotoActionSheet() {
		let actionSheet = UIAlertController(title: "Profile Picture",
											message: "How would you like to select a picture?",
											preferredStyle: .actionSheet)
		actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
			self?.presentCamera()
		}))
		actionSheet.addAction(UIAlertAction(title: "Chose Photo", style: .default, handler: { [weak self] _ in
			self?.presentPhotoPicker()
		}))
		
		present(actionSheet, animated: true)
	}
	
	func presentCamera() {
		let vc = UIImagePickerController()
		vc.sourceType = .camera
		vc.delegate = self
		vc.allowsEditing = true
		present(vc, animated: true)
	}
	// TODO: UIImagePickerController -> PHPicker로 전환해야함
	func presentPhotoPicker() {
		let vc = UIImagePickerController()
		vc.sourceType = .photoLibrary
		vc.delegate = self
		vc.allowsEditing = true
		present(vc, animated: true)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		picker.dismiss(animated: true)
		print(info)
		guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}

		self.logoImageView.image = selectedImage
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true)
	}
}
