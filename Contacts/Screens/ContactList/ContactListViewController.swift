//
//  ViewController.swift
//  Contacts
//
//  Created by Philipp on 17.05.2022.
//

import UIKit
import GRDB

class ContactListViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		self.view.backgroundColor = .lightGray
		self.title = Local("Contacts.Title")
		self.navigationController?.navigationBar.prefersLargeTitles = true
		openDatabase()
		
		if let dbQueue = try? DatabaseQueue(path: "/Users/philipp/Library/Developer/CoreSimulator/Devices/613C1966-F70C-4680-B3D3-2B063D37BC63/data/Containers/Data/Application/F87A27FF-8A53-440B-95F3-DCE792DB365A/Documents/Database.sqlite") {
			// 2. Define the database schema
			try? dbQueue.write { db in
				//				try db.create(table: "player") { t in
				//					t.autoIncrementedPrimaryKey("id")
				//					t.column("name", .text).notNull()
				//					t.column("score", .integer).notNull()
				//				}
			}
		}
		
		//downloadJSON()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setNeedsStatusBarAppearanceUpdate()
	}
	override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
	}
	
	func downloadJSON() {
		let baseURL = "https://raw.githubusercontent.com/"
		guard let url = URL(string: "\(baseURL)SkbkonturMobile/mobile-test-ios/master/json/generated-01.json") else { return }
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			do {
				guard let data = data else { return }
				let decoder = JSONDecoder()
				decoder.dateDecodingStrategy = .iso8601
				let array = try decoder.decode([Person].self, from: data)
				print("Got data:", array)
			} catch {
				print("Data loading fails with error:", error)
			}
		}.resume()
	}
	
	func openDatabase() -> OpaquePointer? {
		var db: OpaquePointer?
		
		let fileUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Database.sqlite")
		if sqlite3_open(fileUrl?.path, &db) == SQLITE_OK {
			print("Successfully opened connection to database at \(fileUrl)")
			return db
		} else {
			print("Unable to open database.")
			return nil
		}
	}
}

