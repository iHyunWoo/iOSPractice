//
//  HomeFastSelectTableViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/27.
//

import UIKit
import SnapKit

class HomeFastSelectTableViewCell: UITableViewCell {
	static let identifier = "HomeFastSelectTableViewCell"
	
	lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.text = "이 노래로 뮤직 스테이션 시작하기"
		label.textColor = .systemGray3
		label.font = UIFont.systemFont(ofSize: 15)
		
		return label
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "빠른 선곡"
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
		
		return label
	}()
	
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		return colletionView
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureViews() {
		[descriptionLabel, titleLabel, collectionView]
			.forEach {contentView.addSubview($0)}
		
		descriptionLabel.snp.makeConstraints {
			$0.top.equalToSuperview().inset(20)
			$0.leading.equalToSuperview().inset(15)
		}
		
		titleLabel.snp.makeConstraints {
			$0.top.equalTo(descriptionLabel).inset(20)
			$0.leading.equalTo(descriptionLabel)
		}
		
		collectionView.snp.makeConstraints {
			$0.top.equalTo(titleLabel).inset(20)
			$0.leading.equalTo(descriptionLabel)
		}
	}
	
	

    

}
