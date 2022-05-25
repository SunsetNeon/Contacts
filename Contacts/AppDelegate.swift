//
//  AppDelegate.swift
//  Contacts
//
//  Created by Philipp on 17.05.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		let nc = UINavigationController(rootViewController: ContactListViewController())
		//nc.navigationBar.isTranslucent = false
		window?.rootViewController = nc
		//nc.navigationBar.tintColor = UIColor.whiteColor()
		window?.makeKeyAndVisible()
		return true
	}
}

