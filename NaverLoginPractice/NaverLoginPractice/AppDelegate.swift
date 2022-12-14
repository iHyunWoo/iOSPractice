//
//  AppDelegate.swift
//  NaverLoginPractice
//
//  Created by 정현우 on 2022/12/09.
//

import UIKit
import NaverThirdPartyLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let instance = NaverThirdPartyLoginConnection.getSharedInstance()
		// 네이버 앱으로 인증하는 방식 활성화
		instance?.isNaverAppOauthEnable = true
		// 사파리에서 인증하는 방식 활성화
		instance?.isInAppOauthEnable = true
		// 인증화면을 iPhone의 세로모드에서만 사용
		instance?.isOnlyPortraitSupportedInIphone()
		
		// 로그인 설정 -> NaverThirdPartyConstantsForApp.h에 define
		instance?.serviceUrlScheme = kServiceAppUrlScheme
		instance?.consumerKey = kConsumerKey
		instance?.consumerSecret = kConsumerSecret
		instance?.appName = kServiceAppName
		
		return true
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

