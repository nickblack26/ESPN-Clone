//
//  ScoresFeedSectionView.swift
//  ESPN Clone
//
//  Created by Nick on 9/16/23.
//

import SwiftUI



struct ScoresFeedSectionView: View {
	var sport: Sport
	var events: [EventModel]
	
    var body: some View {
		Section {
			ForEach(events) { event in
				ForEach(event.competitions) { competition in
					NavigationLink(value: event) {
						CompetitionListItemView(competition: competition)
					}
				}
			}
		} header: {
			HStack {
				Image(sport.logo)
					.resizable()
					.scaledToFit()
					.frame(height: 25)
				
				VStack(alignment: .leading) {
					Text(sport.title)
						.font(.headline)
						.fontWeight(.bold)
					
					
					Text(sport.subtitle.uppercased())
						.font(.caption)
						.foregroundStyle(.secondary)
				}
				
				Spacer()
				
				NavigationLink {
					
				} label: {
					Text("See All")
						.font(.callout)
				}
				.foregroundStyle(.link)
			}
			.foregroundStyle(.primary)
		}
    }
}

#Preview {
	NavigationStack {
		ScoresFeedSectionView(sport: .collegeFootball, events: testEvents)
	}
}
