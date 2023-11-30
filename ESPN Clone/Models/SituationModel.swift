//
//  SituationModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct SituationModel: Codable {
	var shortDownDistanceText: String?
	var possessionText: String?
	var possession: String?
	
	enum CodingKeys: String, CodingKey {
		case shortDownDistanceText, possessionText, possession
	}
}


