//
//  HomeTopBarTableViewCell.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/27.
//

import UIKit
import SnapKit

class HomeTopBarTableViewCell: UITableViewCell {
	
	static let identifier = "HomeTopBarTableViewCell"
	
	lazy var titleLogoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "YTMusicLogo")
		imageView.contentMode = .scaleAspectFit
		
		return imageView
	}()
	
	lazy var remoteImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "tv")
		imageView.tintColor = .white
		
		return imageView
	}()
	
	lazy var searchImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "magnifyingglass")
		imageView.tintColor = .white
		
		return imageView
	}()
	
	lazy var profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "person")
		imageView.tintColor = .white
		
		return imageView
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureViews() {
		contentView.backgroundColor = .black
		[titleLogoImageView, profileImageView, searchImageView, remoteImageView]
			.forEach {contentView.addSubview($0)}
		
		titleLogoImageView.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.leading.equalToSuperview().inset(15)
			$0.width.equalTo(150)
			$0.height.equalTo(30)
		}
		
		profileImageView.snp.makeConstraints {
			$0.centerY.equalTo(titleLogoImageView)
			$0.trailing.equalToSuperview().inset(20)
			$0.width.equalTo(23)
			$0.height.equalTo(23)
		}
		
		searchImageView.snp.makeConstraints {
			$0.centerY.equalTo(titleLogoImageView)
			$0.trailing.equalTo(profileImageView.snp.leading).offset(-20)
			$0.width.equalTo(23)
			$0.height.equalTo(23)
		}
		
		remoteImageView.snp.makeConstraints {
			$0.centerY.equalTo(titleLogoImageView)
			$0.trailing.equalTo(searchImageView.snp.leading).offset(-20)
			$0.width.equalTo(23)
			$0.height.equalTo(23)
		}
		
		
	}

}
