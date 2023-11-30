//
//  CompetitionDetailView.swift
//  ESPN Clone
//
//  Created by Nick on 9/23/23.
//

import SwiftUI

struct EventDetailView: View {
	var event: EventModel
	
	var body: some View {
		ForEach(event.competitions) { competition in
			VStack(alignment: .leading) {
				HStack {
					if let competitor = competition.competitors.first {
						CompetitorView(style: .vertical, logo: URL(string: competitor.team.logo), title: competitor.team.location, rank: competitor.curatedRank?.current ?? 0 > 25 ? nil : competitor.curatedRank?.current, record: competitor.records[0].summary)
						
						Spacer()
						
						Text(competitor.score ?? "0")
							.font(.title3)
							.fontWeight(.bold)
					}
					
					Spacer()
					
					VStack {
						if let broadcast = competition.broadcasts.first {
							Text(broadcast.names[0])
						}
						Text("9:39 - 2nd")
					}
					
					Spacer()
					
					if let competitor = competition.competitors.last {
						Text(competitor.score ?? "0")
							.font(.title3)
							.fontWeight(.bold)
						
						Spacer()
						
						CompetitorView(style: .vertical, logo: URL(string: competitor.team.logo), title: competitor.team.location, rank: competitor.curatedRank?.current ?? 0 > 25 ? nil : competitor.curatedRank?.current, record: competitor.records[0].summary)
					}
				}
				
				Divider()
				
				List {
					ScrollView(.horizontal) {
						HStack {
							Text("Gamecast")
							Text("Recap")
							Text("Box Score")
							Text("Play-by-Play")
							Text("Team Stats")
							Text("Videos")
						}
					}.listRowSeparator(.hidden).scrollIndicators(.hidden)
					
					Divider()
					
					Button {
						
					} label: {
						HStack {
							Image(systemName: "play.fill")
							Text("Watch")
						}
					}
					.padding(.horizontal, 50)
					.padding(.vertical, 5)
					.background(Capsule().fill(.blue))
					.foregroundStyle(.white)
					.frame(maxWidth: .infinity)
					.listRowSeparator(.hidden)
				}
				.listStyle(.plain)
				.listRowInsets(.none)
			}
		}
		.navigationTitle(event.shortName)
		.toolbarTitleDisplayMode(.inline)
	}
}

#Preview {
	NavigationStack {
		EventDetailView(event: testEvents[0])
	}
}
