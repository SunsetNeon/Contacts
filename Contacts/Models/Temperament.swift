//
//  Temperament.swift
//  Contacts
//
//  Created by Philipp on 18.05.2022.
//

import Foundation
import GRDB

enum Temperament: String, Codable, FetchableRecord, PersistableRecord {
	case melancholic
	case phlegmatic
	case sanguine
	case choleric
}
