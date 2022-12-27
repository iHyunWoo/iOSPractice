//
//  HomeMoodCollectionViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/27.
//

import UIKit
import SnapKit

class HomeMoodCollectionViewCell: UICollectionViewCell {
	static let identifier = "HomeMoodCollectionViewCell"
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		
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
		contentView.backgroundColor = UIColor(named: "tintColor")
		contentView.layer.borderColor = UIColor.lightGray.cgColor
		contentView.layer.borderWidth = 0.25
		contentView.layer.cornerRadius = 10
		
		contentView.addSubview(titleLabel)
		
		titleLabel.snp.makeConstraints {
			$0.center.equalTo(contentView)
		}
	}
}
