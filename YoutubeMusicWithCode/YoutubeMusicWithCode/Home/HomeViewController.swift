//
//  HomeViewController.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/27.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

	lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(HomeTopBarTableViewCell.self, forCellReuseIdentifier: HomeTopBarTableViewCell.identifier)
		tableView.register(HomeMoodTableViewCell.self, forCellReuseIdentifier: HomeMoodTableViewCell.identifier)
		tableView.register(HomeFastSelectTableViewCell.self, forCellReuseIdentifier: HomeFastSelectTableViewCell.identifier)
		tableView.register(HomePlaylistTableViewCell.self, forCellReuseIdentifier: HomePlaylistTableViewCell.identifier)
		tableView.backgroundColor = .black
		
		return tableView
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		navigationController?.navigationBar.isHidden = true

		configureViews()
    }

}

extension HomeViewController {
	func configureViews() {
		view.addSubview(tableView)
		
		tableView.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide)
			$0.leading.equalToSuperview()
			$0.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
	}
	

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopBarTableViewCell.identifier) as? HomeTopBarTableViewCell else {return UITableViewCell()}
			
			return cell
		case 1:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeMoodTableViewCell.identifier) as? HomeMoodTableViewCell else {return UITableViewCell()}
			
			return cell
		case 2:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFastSelectTableViewCell.identifier) as? HomeFastSelectTableViewCell else {return UITableViewCell()}
			return cell
		case 3:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: HomePlaylistTableViewCell.identifier) as? HomePlaylistTableViewCell else {return UITableViewCell()}
			cell.titleLabel.text = "차트"
			return cell
		default:
			return UITableViewCell()
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
		case 0:
			return 50
		case 1:
			return 40+10
		case 2:
			let cellHeight = 50.0
			let cellCount = 4.0
			let cellSpacing = 3.0
			return 90 + cellHeight * cellCount + cellSpacing * (cellCount-1)
		case 3:
			return 200
		default:
			return 0
		}
	}
	
}
