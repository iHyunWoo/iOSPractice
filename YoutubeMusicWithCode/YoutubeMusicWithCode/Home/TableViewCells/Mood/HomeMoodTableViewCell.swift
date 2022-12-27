//
//  HomeMoodTableViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/27.
//

import UIKit
import SnapKit

class HomeMoodTableViewCell: UITableViewCell {
	
	static let identifier = "HomeMoodTableViewCell"
	
	let moodList = ["운동", "휴식", "에너지 충전", "집중", "출퇴근/등하교"]
	
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.register(HomeMoodCollectionViewCell.self, forCellWithReuseIdentifier: HomeMoodCollectionViewCell.identifier)
		collectionView.backgroundColor = .black
		
		
		return collectionView
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		configureViews()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

	func configureViews() {
		contentView.backgroundColor = .black
		contentView.addSubview(collectionView)
		
		collectionView.snp.makeConstraints {
			$0.top.equalToSuperview().inset(10)
			$0.leading.equalToSuperview().inset(15)
			$0.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
	}
}

extension HomeMoodTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return moodList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMoodCollectionViewCell.identifier, for: indexPath) as? HomeMoodCollectionViewCell else {return UICollectionViewCell()}
		cell.titleLabel.text = moodList[indexPath.row]
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMoodCollectionViewCell.identifier, for: indexPath) as? HomeMoodCollectionViewCell else {return .zero}
		cell.titleLabel.text = moodList[indexPath.row]
		cell.titleLabel.sizeToFit()
		let cellWidth = cell.titleLabel.frame.width + 30
		return CGSize(width: cellWidth, height: 40)
	}
	
	
	
	
	
}
