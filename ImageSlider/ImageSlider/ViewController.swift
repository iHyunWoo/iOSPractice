//
//  ViewController.swift
//  ImageSlider
//
//  Created by 정현우 on 2022/12/19.
//

import UIKit
import CardsLayout
// https://github.com/filletofish/CardsLayout

class ViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	@IBOutlet weak var descriptionLabel: UILabel!
	
	
	let colorList: [UIColor] = [.red, .blue, .yellow, .black, .brown, .cyan, .darkGray, .gray]
	let colorNameList: [String] = ["red", "blue", "yellow", "black", "brown", "cyan", "darkGray", "gray"]
	var currentIndex = 0
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.collectionViewLayout = CardsCollectionViewLayout()
		collectionView.isPagingEnabled = true
		collectionView.showsHorizontalScrollIndicator = false
	}


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return colorList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		
		cell.backgroundColor = colorList[indexPath.row]
		cell.layer.cornerRadius = 10
//		cell.layer.zPosition = CGFloat(colorList.count - indexPath.row - 1)
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(colorList[indexPath.row])
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		var tempList: [Int] = []
		for cell in collectionView.visibleCells {
			let indexPath = collectionView.indexPath(for: cell)
			tempList.append(indexPath!.row)
		}
//		print(tempList.min()!)
		descriptionLabel.text = "this color is \(colorNameList[tempList.min()!])"
		
//		let indexPath = collectionView.indexPath(for: collectionView.visibleCells.first!)
//		print(indexPath?.row)
	}
		
		
	
}

