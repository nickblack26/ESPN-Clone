//
//  SportModel.swift
//  ESPN Clone
//
//  Created by Nick on 11/28/23.
//

import Foundation

//enum Sport {
//	case collegeFootball
//	case football
//	case fantasyFootball
//	
//	var logo: String {
//		switch self {
//			case .football: return "Football_Logo"
//			case .fantasyFootball: return "FantasyFootball_Logo"
//			case .collegeFootball: return "Football_Logo"
//		}
//	}
//	
//	var title: String {
//		switch self {
//			case .football: return "Football"
//			case .fantasyFootball: return "Fantasy Football"
//			case .collegeFootball: return "College Football"
//		}
//	}
//	
//	var subtitle: String {
//		switch self {
//			case .football: return "Football"
//			case .fantasyFootball: return "Fantasy Football"
//			case .collegeFootball: return "Saturday's Games"
//		}
//	}
//}

enum Sport: String, CaseIterable {
	case collegeFootball = "College Football"
	case nfl = "NFL"
	case mlb = "mlb"
	case collegeBaseball = "collegeBaseball"
	case hockey = "Hockey"
	case nba = "NBA"
	case wnba = "WNBA"
	case ncaaw = "Women's College Basketball"
	case ncaam = "Men's College Basketball"
	case epl = "Premier League"
	case usa1 = "MLS"
	
	var logo: String {
		switch self {
			case .collegeFootball:
				"College Football"
			case .nfl:
				"Football_Logo"
			default:
				"College Football"
		}
	}
	
	var title: String {
		switch self {
			case .nfl:
				"Football"
			case .collegeFootball:
				"College Football"
			default:
				"Football"
		}
	}
	
	var subtitle: String {
		switch self {
			case .nfl: 
				"Football"
			case .collegeFootball:
				"Saturday's Games"
			default:
				"Football"
		}
	}
	
	var apiEndpoint: String {
		switch self {
			case .collegeFootball:
				"/football/college-football"
			case .nfl:
				"/football/nfl"
			case .mlb:
				"/baseball/mlb"
			case .collegeBaseball:
				"/baseball/college-baseball"
			case .hockey:
				"/hockey/nhl"
			case .nba:
				"/basketball/nba"
			case .wnba:
				"/basketball/wnba"
			case .ncaaw:
				"/basketball/womens-college-basketball"
			case .ncaam:
				"/basketball/mens-college-basketball"
			case .epl:
				"/soccer/eng.1"
			case .usa1:
				"/soccer/usa.1"
		}
	}
}
