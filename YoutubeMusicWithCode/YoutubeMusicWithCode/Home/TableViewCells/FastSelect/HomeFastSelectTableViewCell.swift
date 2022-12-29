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
		label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		
		return label
	}()
	
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumInteritemSpacing = 3

		let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		colletionView.register(HomeFastSelectCollectionViewCell.self, forCellWithReuseIdentifier: HomeFastSelectCollectionViewCell.identifier)
		colletionView.backgroundColor = .black
		colletionView.showsHorizontalScrollIndicator = false
//		colletionView.isPagingEnabled = true
		colletionView.decelerationRate = .fast
		
		
		return colletionView
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
		[descriptionLabel, titleLabel, collectionView]
			.forEach {contentView.addSubview($0)}
		
		descriptionLabel.snp.makeConstraints {
			$0.top.equalToSuperview().inset(20)
			$0.leading.equalToSuperview().inset(15)
		}
		
		titleLabel.snp.makeConstraints {
			$0.top.equalTo(descriptionLabel.snp.bottom).offset(2)
			$0.leading.equalTo(descriptionLabel)
		}
		
		collectionView.snp.makeConstraints {
			$0.top.equalTo(titleLabel.snp.bottom).offset(10)
			$0.leading.equalTo(descriptionLabel)
			$0.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
	}
	
}

extension HomeFastSelectTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFastSelectCollectionViewCell.identifier, for: indexPath) as? HomeFastSelectCollectionViewCell else {return UICollectionViewCell()}
		cell.titleLabel.text = "Ditto\(indexPath.row)"
		cell.artistLabel.text = "NewJeans"
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = contentView.frame.width - 20 - 30
		return CGSize(width: cellWidth, height: 50)
	}
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
		let cellWidthIncludingSpacing = contentView.frame.width - 20 - 30 + layout.minimumLineSpacing
//		let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing -> layout이 itemSize를 정하는 life cycle이 맞지 않아 적용이 안되는 것 같음
		
		let estimateIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
		var index: Int
		
		if velocity.x > 0 {
			index = Int(ceil(estimateIndex))
		} else if velocity.x < 0 {
			index = Int(floor(estimateIndex))
		} else {
			index = Int(round(estimateIndex))
		}

		targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
		
	}
	
	
	
}
