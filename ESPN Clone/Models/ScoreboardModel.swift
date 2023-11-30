//
//  ScoreboardModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/18/23.
//

import Foundation

struct ScoreboardModel: Codable {
	var events: [EventModel]
	
	enum CodingKeys: String, CodingKey {
		case events
	}
}
