//
//  TeamScoreView.swift
//  ESPN Clone
//
//  Created by Nick on 9/16/23.
//

import SwiftUI

struct CompetitorScoreView: View {
	var competitor: CompetitorModel
	var isFinished: Bool
	var possession: String?
	
	init(competitor: CompetitorModel, isFinished: Bool = false, possession: String? = nil) {
		self.competitor = competitor
		self.isFinished = isFinished
		self.possession = possession
	}
	
    var body: some View {
		HStack {
			CompetitorView(logo: URL(string: competitor.team.logo), title: competitor.team.location, rank: competitor.curatedRank?.current ?? 0 > 25 ? nil : competitor.curatedRank?.current)
			
			if let possession, possession == competitor.team.id {
				Image(systemName: "football.fill")
					.foregroundStyle(.brown)
					.font(.caption)
			}
			
			Spacer()
			
			Text(competitor.score ?? competitor.records[0].summary)
				.fontWeight(.bold)
				.foregroundStyle(competitor.winner != nil ? .primary : .secondary)
		}
		.padding(.trailing)
		.overlay(alignment: .trailing, content: {
			if let winner = competitor.winner {
				if winner && isFinished {
					Image(systemName: "arrowtriangle.left.fill")
						.font(.caption)
						.foregroundStyle(.primary)
				}
			}
		})
    }
}

#Preview {
	CompetitorScoreView(competitor: testCompetitors[1], isFinished: true)
}
