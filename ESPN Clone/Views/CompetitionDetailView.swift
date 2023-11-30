import SwiftUI

struct CompetitionDetailView: View {
	var competition: CompetitionModel
	
	init(_ competition: CompetitionModel) {
		self.competition = competition
	}
	
    var body: some View {
		VStack {
			CompetitionListItemView(competition.competitors)
			
			VideoOverlayStatsView(competition.competitors[0].statistics)
		}
		.scenePadding()
    }
}

#Preview {
	CompetitionDetailView(.init(id: "123", competitors: testCompetitors, broadcasts: testBroadcasts))
}
