import SwiftUI

struct VideoOverlayStatsView: View {
	var stats: [StatisticModel]
	
	init(_ stats: [StatisticModel]) {
		self.stats = stats
	}
	
	var body: some View {
		List {
			ForEach(stats.indices, id: \.self) { index in
				BoxscoreStatView(
					stats[index],
					stats[index + 1]
				)
				.listRowBackground(EmptyView())
				.listRowSeparator(.hidden)
			}
		}
		.listStyle(.plain)
		.scrollContentBackground(.hidden)
	}
}

#Preview {
	VideoOverlayStatsView([])
}

struct BoxscoreTeamModel: Codable {
	var team: TeamModel
	var statistics: [StatisticModel]
	
	static func examples() -> [BoxscoreTeamModel] {
		[
			.init(
				team: .init(
					id: "26",
					location: "Florida",
					name: "Panthers",
					logo: "https://a.espncdn.com/i/teamlogos/nhl/500/fla.png"
				),
				statistics: [
					.init(
						name: "blockedShots",
						abbreviation: "BS",
						displayValue: "6",
						label: "Blocked Shots"
					),
					.init(
						name: "hits",
						abbreviation: "HT",
						displayValue: "19",
						label: "Hits"
					),
					.init(
						name: "takeaways",
						abbreviation: "TK",
						displayValue: "5",
						label: "Takeaways"
					),
					.init(
						name: "shotsTotal",
						abbreviation: "S",
						displayValue: "22",
						label: "Shots"
					),
					.init(
						name: "powerPlayGoals",
						abbreviation: "PPG",
						displayValue: "3",
						label: "Power Play Goals"
					),
					.init(
						name: "powerPlayOpportunities",
						abbreviation: "PPO",
						displayValue: "3",
						label: "Power Play Opportunities"
					),
					.init(
						name: "powerPlayPct",
						abbreviation: "PCT",
						displayValue: "100.0",
						label: "Power Play Percentage"
					),
					.init(
						name: "shortHandedGoals",
						abbreviation: "SHG",
						displayValue: "0",
						label: "Short Handed Goals"
					),
					.init(
						name: "shootoutGoals",
						abbreviation: "SOG",
						displayValue: "0",
						label: "Shootout Goals"
					),
					.init(
						name: "faceoffsWon",
						abbreviation: "FW",
						displayValue: "16",
						label: "Faceoffs Won"
					),
					.init(
						name: "faceoffPercent",
						abbreviation: "FO%",
						displayValue: "40.0",
						label: "Faceoff Win Percent"
					),
					.init(
						name: "giveaways",
						abbreviation: "GV",
						displayValue: "1",
						label: "Giveaways"
					),
					.init(
						name: "penalties",
						abbreviation: "PN",
						displayValue: "4",
						label: "Total Penalties"
					),
					.init(
						name: "penaltyMinutes",
						abbreviation: "PIM",
						displayValue: "10",
						label: "Penalty Minutes"
					)
				]
			),
			.init(
				team: .init(
					id: "14",
					location: "Ottawa",
					name: "Senators",
					logo: "https://a.espncdn.com/i/teamlogos/nhl/500/ott.png"
				),
				statistics: [
					.init(
						name: "blockedShots",
						abbreviation: "BS",
						displayValue: "13",
						label: "Blocked Shots"
					),
					.init(
						name: "hits",
						abbreviation: "HT",
						displayValue: "23",
						label: "Hits"
					),
					.init(
						name: "takeaways",
						abbreviation: "TK",
						displayValue: "4",
						label: "Takeaways"
					),
					.init(
						name: "shotsTotal",
						abbreviation: "S",
						displayValue: "13",
						label: "Shots"
					),
					.init(
						name: "powerPlayGoals",
						abbreviation: "PPG",
						displayValue: "0",
						label: "Power Play Goals"
					),
					.init(
						name: "powerPlayOpportunities",
						abbreviation: "PPO",
						displayValue: "3",
						label: "Power Play Opportunities"
					),
					.init(
						name: "powerPlayPct",
						abbreviation: "PCT",
						displayValue: "0.0",
						label: "Power Play Percentage"
					),
					.init(
						name: "shortHandedGoals",
						abbreviation: "SHG",
						displayValue: "0",
						label: "Short Handed Goals"
					),
					.init(
						name: "shootoutGoals",
						abbreviation: "SOG",
						displayValue: "0",
						label: "Shootout Goals"
					),
					.init(
						name: "faceoffsWon",
						abbreviation: "FW",
						displayValue: "24",
						label: "Faceoffs Won"
					),
					.init(
						name: "faceoffPercent",
						abbreviation: "FO%",
						displayValue: "60.0",
						label: "Faceoff Win Percent"
					),
					.init(
						name: "giveaways",
						abbreviation: "GV",
						displayValue: "9",
						label: "Giveaways"
					),
					.init(
						name: "penalties",
						abbreviation: "PN",
						displayValue: "4",
						label: "Total Penalties"
					),
					.init(
						name: "penaltyMinutes",
						abbreviation: "PIM",
						displayValue: "8",
						label: "Penalty Minutes"
					),
				]
			)
		]
	}
}

struct BoxscoreModel: Codable {
	var teams: [BoxscoreTeamModel]
	//	var players: [TeamModel]
	
	static func examples() -> [BoxscoreModel] {
		[
			.init(
				teams: BoxscoreTeamModel.examples()
			)
		]
	}
}

struct StatisticModel: Codable {
	var name: String
	var abbreviation: String
	var displayValue: String
	var label: String?
	
	static func examples() -> [StatisticModel] {
		[
			.init(
				name: "blockedShots",
				abbreviation: "BS",
				displayValue: "13",
				label: "Blocked Shots"
			),
			.init(
				name: "hits",
				abbreviation: "HT",
				displayValue: "23",
				label: "Hits"
			),
			.init(
				name: "takeaways",
				abbreviation: "TK",
				displayValue: "4",
				label: "Takeaways"
			),
		]
	}
}

