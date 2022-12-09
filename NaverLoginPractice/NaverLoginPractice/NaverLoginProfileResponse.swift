//
//  NaverLoginProfileResponse.swift
//  NaverLoginPractice
//
//  Created by 정현우 on 2022/12/09.
//

import Foundation

// MARK: - NaverLoginProfileResponse
struct NaverLoginProfileResponse: Codable {
	let resultcode, message: String
	let response: Response
}

// MARK: - Response
struct Response: Codable {
	let email, nickname, name: String
//	let email, nickname: String
//	let profileImage: String
//	let age, gender, id, name: String
//	let birthday, birthyear, mobile: String
}
