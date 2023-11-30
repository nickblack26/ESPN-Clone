import SwiftUI
import AVKit

enum LiveVideoTab: String, CaseIterable {
	case Info
	case Stats
	case LineUps = "Line-ups"
}

struct LiveVideoView: View {
	@State private var liveVideoTab: LiveVideoTab = .Info
	@State private var tabProgress: CGFloat = 0
	@State private var showDetails: Bool = false
	@State private var checkpoint: CheckpointModel?
	
	var body: some View {
		GeometryReader {
			let size = $0.size
			VideoPlayer(
				player:
					.init(
						url: URL(
							string: "https://media.video-cdn.espn.com/motion/2023/0914/dm_230914_dm_230914_FT_NFL_duos_pub2tag/dm_230914_dm_230914_FT_NFL_duos_pub2tag_360p30_1464k.mp4"
						)!
					)
			) {
				ZStack {
					HStack {
						Button {
							withAnimation(.smooth) {
								showDetails.toggle()
							}
						} label: {
							Image(
								systemName: "chart.dots.scatter"
							)
						}
						.buttonStyle(.plain)
						.background(.ultraThinMaterial)
						.clipShape(Circle())
						.padding(4)
						
					}
					.padding()
					.transition(
						.scale
							.combined(with: .opacity)
							.combined(with: .move(edge: .top)
									 )
					)
					.animation(.smooth, value: showDetails)
					.frame(
						maxWidth: .infinity,
						maxHeight: .infinity,
						alignment: .topTrailing
					)
					
					VideoOverlayInfoCard(
						$showDetails,
						size,
						checkpoint?.boxscore ?? .init(teams: BoxscoreTeamModel.examples())
					)
						.padding()
						.frame(
							maxWidth: .infinity,
							maxHeight: .infinity,
							alignment: .topTrailing
						)
				}
			}
		}
		.task {
			var request = URLRequest(url: URL(string: "https://fcast.espncdn.com/FastcastService/pubsub/profiles/12000/topic/gp-hockey-nhl-401559550/message/758/checkpoint")!)
			request.httpMethod = "GET"
			let session = URLSession.shared
			let decoder = JSONDecoder()
			do {
				let (data, _) = try await session.data(for: request)
				let returnedData = try decoder.decode(CheckpointModel.self, from: data)
				checkpoint = returnedData
			} catch {
				print(String(describing: error))
			}
		}
	}
}

#Preview {
	LiveVideoView()
}

struct GameInfoModel: Codable {
	var venue: VenueModel
//	var venue: VenueModel
}

struct CheckpointModel: Codable {
	let boxscore: BoxscoreModel
	let gameInfo: GameInfoModel
}
