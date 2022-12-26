//
//  HomeViewController.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/26.
//

import UIKit
import SwiftUI
import SnapKit

class HomeViewController: UIViewController {
	
	var gradientLayer: CAGradientLayer!
	
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
	
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.backgroundColor = .clear
		
		return collectionView
	}()
	
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
		
		configureGradientLayer()
		configureBlurEfffect()
		configureViews()
    }
	
	

}

extension HomeViewController {
	// 빨강, 파랑 그라데이션 구성
	func configureGradientLayer() {
		self.gradientLayer = CAGradientLayer()
		self.gradientLayer?.frame = self.view.bounds
		self.gradientLayer.colors = [
			UIColor(red: 0.44, green: 0.25, blue: 0.28, alpha: 1).cgColor,
			UIColor(red: 0.1, green: 0.23, blue: 0.27, alpha: 1).cgColor,
			UIColor.black.cgColor]
		self.gradientLayer.locations = [0.1, 0.2, 0.35]
		self.view.layer.addSublayer(self.gradientLayer)
		
	}
	// 배경 블러 처리
	func configureBlurEfffect() {
		let blurEffect = UIBlurEffect()
		let visualEffectView = UIVisualEffectView(effect: blurEffect)
		visualEffectView.frame = self.view.frame
		view.addSubview(visualEffectView)
	}
	
	func configureViews() {
		[titleLogoImageView, profileImageView, searchImageView, remoteImageView]
			.forEach {view.addSubview($0)}
		
		[collectionView]
			.forEach {view.addSubview($0)}
		
		titleLogoImageView.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide).inset(-20)
			$0.leading.equalToSuperview().inset(20)
			$0.width.equalTo(150)
			$0.height.equalTo(30)
		}
		
		profileImageView.snp.makeConstraints {
			$0.centerY.equalTo(titleLogoImageView)
			$0.trailing.equalToSuperview().inset(20)
			$0.width.equalTo(25)
			$0.height.equalTo(25)
		}
		
		searchImageView.snp.makeConstraints {
			$0.centerY.equalTo(titleLogoImageView)
			$0.trailing.equalTo(profileImageView).inset(50)
			$0.width.equalTo(25)
			$0.height.equalTo(25)
		}
		
		remoteImageView.snp.makeConstraints {
			$0.centerY.equalTo(titleLogoImageView)
			$0.trailing.equalTo(searchImageView).inset(50)
			$0.width.equalTo(25)
			$0.height.equalTo(25)
		}
		
		collectionView.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
			$0.leading.equalToSuperview()
			$0.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
		
	}
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 100
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
		cell.backgroundColor = .brown
		
		return cell
	}
	
	
}

//struct HomeViewController_PreViews: PreviewProvider {
//	static var previews: some View {
//		HomeViewController().toPreview()
//	}
//}
