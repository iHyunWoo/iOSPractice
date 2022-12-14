//
//  HomePlaylistTableViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/29.
//

import UIKit
import SnapKit

class HomePlaylistTableViewCell: UITableViewCell {
	static let identifier = "HomePlaylistTableViewCell"
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		label.textColor = .white
		
		return label
	}()
	
	lazy var moreButton: UIButton = {
		let button = UIButton()
		button.setTitle("더보기", for: .normal)
		button.layer.borderWidth = 0.5
		button.layer.borderColor = UIColor.white.cgColor
		button.layer.cornerRadius = 12
		button.tintColor = .white
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
		
		return button
	}()
	
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 5
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(HomePlaylistCollectionViewCell.self, forCellWithReuseIdentifier: HomePlaylistCollectionViewCell.identifier)
		collectionView.backgroundColor = .black
		collectionView.showsHorizontalScrollIndicator = false
		
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
		
		[titleLabel, moreButton, collectionView]
			.forEach {contentView.addSubview($0)}
		
		titleLabel.snp.makeConstraints {
			$0.top.equalToSuperview().inset(30)
			$0.leading.equalToSuperview().inset(15)
		}
		
		moreButton.snp.makeConstraints {
			$0.bottom.equalTo(titleLabel)
			$0.trailing.equalToSuperview().inset(15)
			$0.height.equalTo(22)
			$0.width.equalTo(50)
		}
		
		collectionView.snp.makeConstraints {
			$0.top.equalTo(titleLabel.snp.bottom).offset(5)
			$0.leading.equalTo(titleLabel.snp.leading)
			$0.trailing.equalToSuperview()
//			$0.bottom.equalToSuperview()
			$0.height.equalTo(180)
		}
	}
	
	

}

extension HomePlaylistTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePlaylistCollectionViewCell.identifier, for: indexPath) as? HomePlaylistCollectionViewCell else {return UICollectionViewCell()}
		cell.titleLabel.text = "한국 인기곡 Top100"
		cell.descriptionLabel.text = "차트 · Youtube Music"
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 150, height: 200)
	}
	
	
}
