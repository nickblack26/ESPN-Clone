//
//  HomeView.swift
//  ESPN Clone
//
//  Created by Nick on 9/14/23.
//

import SwiftUI


struct HomeView: View {
	var events = testEvents
	@State private var scoringEvents: [EventModel] = []
	@State private var seachText: String = ""
	
    var body: some View {
		List {
			HeaderView()
			
			
			
			ScoresFeedSectionView(sport: .collegeFootball, events: scoringEvents)
		}
		.listStyle(.plain)
		.background(.gray.opacity(0.2))
		.task {
			var request = URLRequest(url: URL(string: "https://site.web.api.espn.com/apis/site/v2/sports/football/college-football/scoreboard")!)
			request.httpMethod = "GET"
			let session = URLSession.shared
			let decoder = JSONDecoder()
			do {
				let (data, _) = try await session.data(for: request)
				let returnedData = try decoder.decode(ScoreboardModel.self, from: data)
				scoringEvents = returnedData.events
			} catch {
				print(String(describing: error))
			}
		}
    }
}

#Preview {
	NavigationStack {
		HomeView()
	}
}


