//
//  BroadcastModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct BroadcastModel: Codable {
	var market: String
	var names: [String]
	
	enum CodingKeys: String, CodingKey {
		case market, names
	}
}
