//
//  HomeFastSelectCollectionViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/29.
//

import UIKit
import SnapKit

class HomeFastSelectCollectionViewCell: UICollectionViewCell {
	static let identifier = "HomeFastSelectCollectionViewCell"
	
	lazy var coverImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "rectangle")
		imageView.tintColor = .white
		
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		
		return label
	}()
	
	lazy var artistLabel: UILabel = {
		let label = UILabel()
		label.textColor = .systemGray3
		label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
		
		return label
	}()
	
	lazy var stackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [titleLabel, artistLabel])
		stackView.axis = .vertical
		stackView.spacing = 3
		
		return stackView
	}()
	
	lazy var optionImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "ellipsis")
		imageView.tintColor = .white
		
		return imageView
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	func configureViews() {
		[coverImageView, stackView, optionImageView]
			.forEach {contentView.addSubview($0)}
		
		coverImageView.snp.makeConstraints {
			$0.width.equalTo(50)
			$0.height.equalTo(50)
			$0.leading.equalToSuperview()
			$0.centerY.equalToSuperview()
		}
		stackView.snp.makeConstraints {
			$0.leading.equalTo(coverImageView.snp.trailing).offset(10)
			$0.centerY.equalTo(coverImageView)
		}
		optionImageView.snp.makeConstraints {
			$0.width.equalTo(25)
			$0.height.equalTo(20)
			$0.centerY.equalToSuperview()
			$0.trailing.equalToSuperview().inset(20)
		}
		
		
	}
	
    
}
