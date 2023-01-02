//
//  LoginViewController.swift
//  Messenger
//
//  Created by 정현우 on 2023/01/01.
//

import UIKit
import SnapKit
import FirebaseAuth

class LoginViewController: UIViewController {
	
	private let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.clipsToBounds = true
		
		return scrollView
	}()
	
	private let logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "logo")
		imageView.contentMode = .scaleAspectFit
		
		return imageView
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
	
	private let loginButton: UIButton = {
		let button = UIButton()
		button.setTitle("Log In", for: .normal)
		button.backgroundColor = .link
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 12
		button.layer.masksToBounds = true
		button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
		
		return button
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = "Log In"
		view.backgroundColor = .white
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
															style: .done,
															target: self,
															action: #selector(didTapRegisterButton))
		configureViews()
		
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		
		emailTextField.delegate = self
		passwordTextField.delegate = self
    }
	
	func configureViews() {
		view.addSubview(scrollView)
		scrollView.frame = view.bounds
		
		[logoImageView, emailTextField, passwordTextField, loginButton]
			.forEach {scrollView.addSubview($0)}
		
		let imageSize = scrollView.bounds.size.width/4
		logoImageView.snp.makeConstraints {
			$0.width.equalTo(imageSize)
			$0.height.equalTo(imageSize)
			$0.top.equalToSuperview().inset(20)
			$0.centerX.equalToSuperview()
		}
		
		emailTextField.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(logoImageView.snp.bottom).offset(20)
			$0.centerX.equalToSuperview()
		}
		
		passwordTextField.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(emailTextField.snp.bottom).offset(10)
			$0.centerX.equalToSuperview()
		}
		
		loginButton.snp.makeConstraints {
			$0.width.equalTo(scrollView.bounds.size.width - 60)
			$0.height.equalTo(52)
			$0.top.equalTo(passwordTextField.snp.bottom).offset(10)
			$0.centerX.equalToSuperview()
		}
	}
	
	@objc private func didTapLoginButton() {
		// 키보드가 내려감
		emailTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
		
		guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
			alertUserLoginError()
			return
		}
		// Firebase Login
		FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
			guard let result = authResult, error == nil else {
				print(error?.localizedDescription ?? "")
				return
			}
			let user = result.user
			print("Logged In User: \(user)")
			
		})
	}
	
	func alertUserLoginError() {
		let alert = UIAlertController(title: "Woops",
									  message: "Please enter all information to log in.",
									  preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
		present(alert, animated: true)
	}
	
	@objc private func didTapRegisterButton() {
		let vc = RegisterViewController()
		vc.navigationItem.title = "Create Account"
		navigationController?.pushViewController(vc, animated: true)
	}
    

    

}

extension LoginViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == emailTextField {
			passwordTextField.becomeFirstResponder()
		} else if textField == passwordTextField {
			didTapLoginButton()
		}
		
		return true
	}
}
