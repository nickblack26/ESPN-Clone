import SwiftUI

struct CompetitionListItemView: View {
	var competitors: [CompetitorModel]
	
	init(_ competitors: [CompetitorModel]) {
 		self.competitors = competitors
	}
	
	var body: some View {
//		let isFinished = competition.status.period >= 4 && competition.status.displayClock == "0:00"
		HStack {
			let homeLogo = competitors[0].team.logo
			
			AsyncImage(url: URL(string: homeLogo)) { image in
				image
					.resizable()
					.scaledToFit()
					.padding(8)
					.background(.ultraThinMaterial)
					.clipShape(RoundedRectangle(cornerRadius: 12))
			} placeholder: {
				RoundedRectangle(cornerRadius: 12)
			}
			
			Spacer()
			
			VStack {
				if let homeScore = competitors[0].score, let awayScore = competitors[1].score {
					Text("\(homeScore):\(awayScore)")
						.font(.title2)
						.fontWeight(.bold)
						.monospaced()
				}
				
				Text("3:27 - 3rd")
					.font(.caption)
					.foregroundStyle(.red)
			}
			
			Spacer()
			let awayLogo = competitors[1].team.logo
			
			AsyncImage(url: URL(string: awayLogo)) { image in
				image
					.resizable()
					.scaledToFit()
					.padding(8)
					.background(.ultraThinMaterial)
					.clipShape(RoundedRectangle(cornerRadius: 12))
			} placeholder: {
				RoundedRectangle(cornerRadius: 12)
			}
			
		}
		.buttonStyle(.plain)
		.frame(maxHeight: 50)
//		HStack(alignment: .top) {
//			VStack {
//				ForEach(competition.competitors) { competitor in
//					CompetitorScoreView(competitor: competitor, isFinished: isFinished, possession: competition.situation?.possession)
//				}
//			}
//			
//			Divider()
//			
//			VStack(alignment: .leading) {
//				HStack(alignment: .top, spacing: 25) {
//					VStack(alignment: .leading) {
//						Text(isFinished ? "Final" : competition.status.displayClock)
//							.font(.caption)
//							.foregroundStyle(isFinished ? .primary : Color.red)
//							.fontWeight(.semibold)
//						if !isFinished {
//							Text(competition.situation?.shortDownDistanceText ?? "")
//								.font(.caption)
//								.foregroundStyle(.secondary)
//								.fontWeight(.bold)
//							
//							Text(competition.situation?.possessionText ?? "")
//								.font(.caption)
//								.foregroundStyle(.secondary)
//							
//							if !competition.broadcasts.isEmpty {
//								Text(competition.broadcasts[0].names[0])
//									.font(.caption)
//									.foregroundStyle(.secondary)
//							}
//						}
//					}
//					
//					if !isFinished {
//						Button {
//							
//						} label: {
//							HStack {
//								Image(systemName: "bell")
//							}
//						}
//					}
//				}
//				
//				
//				Button {
//					
//				} label: {
//				
//					HStack {
//						if !isFinished { Image(systemName: "play.fill") }
//						Text(isFinished ? "Highlights" : "Watch")
//					}
//				}
//				.padding(.horizontal)
//				.padding(.vertical, 5)
//				.foregroundStyle(!isFinished ? .white : .blue)
//				.font(.caption)
//				.background {
//					Capsule()
//						.fill(!isFinished ? .blue : .clear)
//						.border(!isFinished ? .clear : .blue)
//				}
//			}
//		}.padding(.leading)
	}
}


//
//#Preview {
//	CompetitionListItemView(testCompetitions)
//}
