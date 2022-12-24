//
//  ViewController.swift
//  TopTabBar
//
//  Created by 정현우 on 2022/12/24.
//

import UIKit
import Tabman
import Pageboy

class ViewController: TabmanViewController {

	var viewControllers: [UIViewController] = [FirstTabViewController(), SecondTabViewController()]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.dataSource = self
		
		let bar = TMBar.ButtonBar()
		settingTabBar(ctBar: bar)
		addBar(bar, dataSource: self, at: .top)
	}
	
	func settingTabBar(ctBar: TMBar.ButtonBar) {
		ctBar.layout.transitionStyle = .snap
		// 왼쪽 여백주기
	   ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
	   
	   // 간격
	   ctBar.layout.interButtonSpacing = 35
		   
	   ctBar.backgroundView.style = .blur(style: .light)
	   
	   // 선택 / 안선택 색 + font size
	   ctBar.buttons.customize { (button) in
		   button.tintColor = .black
		   button.selectedTintColor = .black
		   button.font = UIFont.systemFont(ofSize: 16)
		   button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
	   }
	   
	   // 인디케이터 (영상에서 주황색 아래 바 부분)
	   ctBar.indicator.weight = .custom(value: 2)
	   ctBar.indicator.tintColor = .orange
	}
	


}

extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
	func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
		return viewControllers.count
	}
	
	func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
		return viewControllers[index]
	}
	
	func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
		return nil
	}
	
	func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
		switch index {
		case 0:
			return TMBarItem(title: "emaple 1")
		case 1:
			return TMBarItem(title: "example 2")
		default:
			let title = "Page \(index)"
			return TMBarItem(title: title)
		}
	}
	
	
}

