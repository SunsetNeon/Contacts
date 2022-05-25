//
//  EducationPeriod.swift
//  Contacts
//
//  Created by Philipp on 18.05.2022.
//

import Foundation
import GRDB

struct EducationPeriod: Codable, FetchableRecord, PersistableRecord {
	var start: Date
	var end: Date
}
