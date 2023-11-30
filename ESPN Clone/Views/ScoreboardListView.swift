import SwiftUI

enum ScoreboardListTab: String, CaseIterable {
	case scores
	case news
	case standings
	case stats
}

struct ScoreboardListView: View {
	@State private var events: [EventModel] = []
	@State private var tabSelection: ScoreboardListTab = .scores
	var sport: Sport
	
	var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(events) { event in
					ForEach(event.competitions) { competition in
						CompetitionListItemView(competition: competition)
					}
				}
			}
		}
		.padding(.horizontal)
		.task {
			let url = URL(string: "https://site.web.api.espn.com/apis/site/v2/sports\(sport.apiEndpoint)/scoreboard")
			var request = URLRequest(url: url!)
			request.httpMethod = "GET"
			let session = URLSession.shared
			let decoder = JSONDecoder()
		
			do {
				let (data, _) = try await session.data(for: request)
				let returnedData = try decoder.decode(ScoreboardModel.self, from: data)
				
				events = returnedData.events
			} catch {
				print(String(describing: error))
			}
		}
	}
}

struct DateSelectorView: View {
	var isSelected: Bool
	var title: String
	var date: String
	
	var body: some View {
		VStack {
			Text(title.uppercased())
				.fontWeight(.bold)
				.font(.footnote)
			
			Text(date.uppercased())
				.font(.caption2)
		}
		.foregroundStyle(isSelected ? .primary : .secondary)
	}
}

#Preview {
	NavigationStack {
		ScoreboardListView(sport: .hockey)
	}
}
