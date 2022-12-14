//
//  ViewController.swift
//  AccordionUI
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var item1 = TitleDataModel(title: "펀드", content: ["이달의 추천 펀드", "펀드 가입", "관심 펀드"], open: true)
	var item2 = TitleDataModel(title: "뱅킹", content: ["잔고", "종합거래내역"], open: false)
	
	var itemList: [TitleDataModel] = []
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		[item1, item2]
			.forEach {itemList.append($0)}
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: TitleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableViewCell.identifier)
		tableView.register(UINib(nibName: ContentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContentTableViewCell.identifier)
	}


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return itemList.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if itemList[section].open == true {
			return 1 + itemList[section].content.count
		} else {
			return 1
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return 60
		} else {
			return 40
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as?  TitleTableViewCell else {return UITableViewCell()}
			cell.titleLabel.text = itemList[indexPath.section].title
			
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier) as? ContentTableViewCell else {return UITableViewCell()}
			cell.contentLabel.text = itemList[indexPath.section].content[indexPath.row - 1]
			return cell
			
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			guard let cell = tableView.cellForRow(at: indexPath) as?  TitleTableViewCell else {return}
			if itemList[indexPath.section].open {
				cell.openButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
				itemList[indexPath.section].open = false
				tableView.reloadData()
			} else {
				cell.openButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
				itemList[indexPath.section].open = true
				tableView.reloadData()
			}
		}
	}
	
	
}

