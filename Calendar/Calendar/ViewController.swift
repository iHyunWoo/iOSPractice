//
//  ViewController.swift
//  Calendar
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var yearMonthLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	let now = Date()
	  var cal = Calendar.current
	  let dateFormatter = DateFormatter()
	  var components = DateComponents()
	  var weeks: [String] = ["일", "월", "화", "수", "목", "금", "토"]
	  var days: [String] = []
	  var daysCountInMonth = 0
	  var weekdayAdding = 0
	  
	  override func viewDidLoad() {
		  super.viewDidLoad()
		  self.initView()
	  }
	 
	  private func initView() {
		  self.initCollection()
		  
		  dateFormatter.dateFormat = "yyyy년 M월"
		  components.year = cal.component(.year, from: now)
		  components.month = cal.component(.month, from: now)
		  components.day = 1
		  self.calculation()
	  }
	  
	  private func initCollection() {
		  self.collectionView.delegate = self
		  self.collectionView.dataSource = self
		  self.collectionView.register(UINib(nibName: CalendarCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
	  }
	  
	  private func calculation() {
		  let firstDayOfMonth = cal.date(from: components)
		  let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
		  daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)!.count
		  weekdayAdding = 2 - firstWeekday
		  
		  self.yearMonthLabel.text = dateFormatter.string(from: firstDayOfMonth!)
		  
		  self.days.removeAll()
		  for day in weekdayAdding...daysCountInMonth {
			  if day < 1 {
				  self.days.append("")
			  } else {
				  self.days.append(String(day))
			  }
		  }
	  }
	
	@IBAction func prevButtonTapped(_ sender: UIButton) {
		components.month = components.month! - 1
		self.calculation()
		self.collectionView.reloadData()
	}
	
	@IBAction func nextButtonTapped(_ sender: UIButton) {
		components.month = components.month! + 1
		self.calculation()
		self.collectionView.reloadData()
	}
	
	

	}

	extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	  func numberOfSections(in collectionView: UICollectionView) -> Int {
		  return 2
	  }
	  
	  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		  switch section {
		  case 0:
			  return 7
		  default:
			  return self.days.count
		  }
	  }
	  
	  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as! CalendarCollectionViewCell
		  
		  switch indexPath.section {
		  case 0:
			  cell.dateLabel.text = weeks[indexPath.row]
		  default:
			  cell.dateLabel.text = days[indexPath.row]
		  }
		  
		  if indexPath.row % 7 == 0 {
			  cell.dateLabel.textColor = .red
		  } else if indexPath.row % 7 == 6 {
			  cell.dateLabel.textColor = .blue
		  } else {
			  cell.dateLabel.textColor = .black
		  }

		  return cell
	  }
	}

	extension ViewController: UICollectionViewDelegateFlowLayout {
	  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		  let myBoundSize: CGFloat = UIScreen.main.bounds.size.width
		  let cellSize : CGFloat = myBoundSize / 9
		  return CGSize(width: cellSize, height: cellSize)
	  }
	}
