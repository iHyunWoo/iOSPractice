//
//  ViewController.swift
//  KakaoLocalKeywordSearchPractice
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
	
	@IBOutlet weak var searchBar: UISearchBar!
	
	@IBOutlet weak var tableView: UITableView!
	
	let restApiKey = "ecd4273b51bd6809b8b36ef45ef699d2"
	
	var responseData: KakaoKeywordSearchResponse?

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UINib(nibName: "LocalKeywordSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
		
		tableView.delegate = self
		tableView.dataSource = self
		
		searchBar.delegate = self
		
//		getData(query: "수내중학교")
	}
	
	func getData(query: String) {
		let url = "https://dapi.kakao.com/v2/local/search/keyword.json"
		let headers: HTTPHeaders = [
			"Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
			"Authorization": "KakaoAK \(restApiKey)"
		]
		let parameters: [String: String] = [
			"query": query
		]
		
		AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
			.validate(statusCode: 200..<300)
			.responseData { response in
				switch response.result {
				case .success(let res):
					let decoder = JSONDecoder()
					do {
						let data = try decoder.decode(KakaoKeywordSearchResponse.self, from: res)
						self.responseData = data
						self.tableView.reloadData()
					} catch {
						print("error in decode")
					}
			
				case .failure(let err):
					print(err.localizedDescription)
				}
			}
	}


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.responseData?.documents.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? LocalKeywordSearchTableViewCell else {return UITableViewCell()}
		cell.placeNameLabel.text = self.responseData?.documents[indexPath.row].place_name ?? ""
		cell.roadAddressName.text = self.responseData?.documents[indexPath.row].road_address_name ?? ""
		
		return cell
	}
	
	
}

extension ViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		self.getData(query: searchBar.text ?? "")
	}
}

