//
//  HomePlaylistCollectionViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/29.
//

import UIKit
import SnapKit

class HomePlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomePlaylistCollectionViewCell"
	
	lazy var coverImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "rectangle.fill")
		imageView.tintColor = .white
		
		
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		label.textAlignment = .left
		
		
		return label
	}()
	
	lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.textColor = .systemGray3
		label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
		label.textAlignment = .left
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureViews() {
		[coverImageView, titleLabel, descriptionLabel]
			.forEach {contentView.addSubview($0)}
		
		coverImageView.snp.makeConstraints {
			$0.width.equalTo(150)
			$0.height.equalTo(150)
			$0.leading.equalToSuperview().inset(-10)
			$0.top.equalToSuperview()
		}
		
		titleLabel.snp.makeConstraints {
			$0.top.equalTo(coverImageView.snp.bottom).offset(1)
			$0.leading.equalToSuperview()
		}
		
		descriptionLabel.snp.makeConstraints {
			$0.top.equalTo(titleLabel.snp.bottom).offset(1)
			$0.leading.equalToSuperview()
		}
		
	}
}
