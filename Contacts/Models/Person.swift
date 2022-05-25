//
//  Person.swift
//  Contacts
//
//  Created by Philipp on 18.05.2022.
//

import Foundation
import GRDB

struct Person: Codable, FetchableRecord, PersistableRecord {
	var id: String
	var name: String
	var phone: String
	var height: Float
	var biography: String
	var temperament: Temperament
	var educationPeriod: EducationPeriod
}
