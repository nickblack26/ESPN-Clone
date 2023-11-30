//
//  CuratedRankModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct CuratedRankModel: Codable {
	var current: Int
	
	enum CodingKeys: String, CodingKey {
		case current
	}
}
