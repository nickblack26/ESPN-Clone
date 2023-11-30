//
//  RecordModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct RecordModel: Codable {
	var name: String
	var abbreviation: String?
	var type: String
	var summary: String
	
	enum CodingKeys: String, CodingKey {
		case name, abbreviation, type, summary
	}
}
