//
//  PopUpViewController.swift
//  CustomPopUp
//
//  Created by 정현우 on 2022/12/15.
//

import UIKit

class PopUpViewController: UIViewController {
	
	static let identifier = "PopUpViewController"
	
	@IBOutlet weak var popupView: UIView!
	

    override func viewDidLoad() {
        super.viewDidLoad()

		// background는 inspector에서 custom으로 opacity 값을 조절함
		
		popupView.layer.cornerRadius = 10
    }
    
	@IBAction func doneButtonTapped(_ sender: UIButton) {
		print("완료 버튼 tapped")
	}
	
    
	@IBAction func cancelButtonTapped(_ sender: UIButton) {
		self.dismiss(animated: false)
	}
	
}
