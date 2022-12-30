//
//  TabBarController.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/26.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tabBar.backgroundColor = UIColor(named: "tintColor")
		tabBar.tintColor = .white
		tabBar.unselectedItemTintColor = .white
		tabBar.isTranslucent = false

		
		
		configureTabBar()
	}
	
	private func configureTabBar() {
		let homeViewController = UINavigationController(rootViewController: HomeViewController())
		homeViewController.tabBarItem.image = UIImage(systemName: "house")
		homeViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
		homeViewController.tabBarItem.title = "홈"
		
		let searchViewController = UINavigationController(rootViewController: SearchViewController())
		searchViewController.tabBarItem.image = UIImage(systemName: "safari")
		searchViewController.tabBarItem.selectedImage = UIImage(systemName: "safari.fill")
		searchViewController.tabBarItem.title = "둘러보기"
		
		let collectionViewController = UINavigationController(rootViewController: CollectionViewController())
		collectionViewController.tabBarItem.image = UIImage(systemName: "play.square.stack")
		collectionViewController.tabBarItem.selectedImage = UIImage(systemName: "play.square.stack.fill")
		collectionViewController.tabBarItem.title = "둘러보기"
		
		
		viewControllers = [homeViewController, searchViewController, collectionViewController]
	}
}
