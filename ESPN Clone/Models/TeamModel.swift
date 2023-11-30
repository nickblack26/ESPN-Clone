//
//  TeamModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct TeamModel: Identifiable, Codable {
	var id: String
	var location: String
	var name: String
	var logo: String
	
	enum CodingKeys: String, CodingKey {
		case id, location, name, logo
	}
}
