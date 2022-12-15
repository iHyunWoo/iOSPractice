//
//  ViewController.swift
//  CustomPopUp
//
//  Created by 정현우 on 2022/12/15.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


	@IBAction func PopUpButtonTapped(_ sender: UIButton) {
		let storyboard = UIStoryboard.init(name: PopUpViewController.identifier, bundle: nil)
		let popupVC = storyboard.instantiateViewController(withIdentifier: PopUpViewController.identifier)
		
		// 투명도가 있으면 투명도에 맞춰서 나오게 함
		popupVC.modalPresentationStyle = .overCurrentContext
		self.present(popupVC, animated: false)
		
	}
}

