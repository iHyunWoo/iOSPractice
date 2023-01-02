//
//  KakaoKeywordSearchResponse.swift
//  KakaoMapPractice
//
//  Created by 정현우 on 2022/12/14.
//

import Foundation

// MARK: - KakaoKeywordSearchResponse
struct KakaoKeywordSearchResponse {
	let documents: [Document]
	let meta: Meta
}

// MARK: - Document
struct Document {
	let address_name: String
	let category_group_code: String
	let category_group_name: String
	let category_name: String
	let distance: String
	let id: String
	let phone: String
	let place_name: String
	let place_url: String
	let road_address_name: String
	let x: String
	let y: String
}

// MARK: - Meta
struct Meta {
	let is_end: Bool
	let pageable_count: Int
	let same_name: SameName
	let total_count: Int
}

// MARK: - SameName
struct SameName {
	let keyword: String
	let region: [Any?]
	let selected_region: String
}
