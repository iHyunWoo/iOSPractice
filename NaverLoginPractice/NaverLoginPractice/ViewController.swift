//
//  ViewController.swift
//  NaverLoginPractice
//
//  Created by 정현우 on 2022/12/09.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

class ViewController: UIViewController {
	
	let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()

	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var nicknameLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		naverLoginInstance?.delegate = self
		
	}
	
	
	@IBAction func loginButtonTapped(_ sender: UIButton) {
		// 로그인
		naverLoginInstance?.requestThirdPartyLogin()
	}
	
	@IBAction func logoutButtonTapped(_ sender: UIButton) {
		// 로그아웃
		naverLoginInstance?.requestDeleteToken()
		
		[emailLabel, nameLabel, nicknameLabel]
			.forEach {$0?.text = "로그인 하세요."}
	}
	
	func naverLoginPaser() {
		guard let isValidAccessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else {return}
		
		
		// 머지 이건
		if !isValidAccessToken {
			return
		}
		
		guard let tokenType = naverLoginInstance?.tokenType else {return}
		guard let accessToken = naverLoginInstance?.accessToken else {return}
		
		
		let requestURL = "https://openapi.naver.com/v1/nid/me"
		let url = URL(string: requestURL)!
		
		let authorization = "\(tokenType) \(accessToken)"
		
		let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
		req
			.validate()
			.responseDecodable(of: NaverLoginProfileResponse.self) { response in
			switch response.result {
			case .success(let res):
				guard res.message == "success" else {return}
				let data = res.response
				
				let email = data.email
				let name = data.name
				let nickname = data.nickname
				
				self.emailLabel.text = email
				self.nameLabel.text = name
				self.nicknameLabel.text = nickname
				
			case .failure(let err):
				print(err.localizedDescription)
			}
		}
	}
	

}

extension ViewController: NaverThirdPartyLoginConnectionDelegate {
	// 로그인에 성공했을 경우 호출
	func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
		print("네이버 로그인 성공")
		naverLoginPaser()
	}
	// 접근 토근 갱신
	func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
		print("네이버 토큰\(naverLoginInstance?.accessToken ?? "")")
	}
	// 로그아웃 할 경우 호출(토큰 삭제)
	func oauth20ConnectionDidFinishDeleteToken() {
		naverLoginInstance?.requestDeleteToken()
		print("네이버 로그아웃")
	}
	// 모든 에러
	func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
		print("에러: \(error.localizedDescription)")
	}
}
