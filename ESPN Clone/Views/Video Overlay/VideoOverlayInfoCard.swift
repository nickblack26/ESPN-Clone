import SwiftUI

struct VideoOverlayInfoCard: View {
	@Environment(\.colorScheme) private var scheme
	@State private var liveVideoTab: LiveVideoTab?
	@State private var tabProgress: CGFloat = 0
	var size: CGSize
	var boxscore: BoxscoreModel
	@Binding var showDetails: Bool
	
	init(
		_ showDetails: Binding<Bool>,
		_ size: CGSize,
		_ boxscore: BoxscoreModel
	) {
		self.size = size
		self.boxscore = boxscore
		self._showDetails = showDetails
	}
	
    var body: some View {
		if showDetails {
			VStack(alignment: .leading, spacing: 16) {
				HStack {
					Text("Game details")
						.fontWeight(.medium)
						.padding([.top, .horizontal])
					
					Spacer()
					
					Button {
						withAnimation(.smooth) {
							showDetails.toggle()
						}
					} label: {
						Image(systemName: "xmark.circle.fill")
							.padding([.top, .trailing])
							.imageScale(.large)
					}
					.buttonStyle(.plain)
				}
				
				HStack(spacing: 0) {
					ForEach(LiveVideoTab.allCases, id: \.self) { tab in
						Text(tab.rawValue)
							.font(.callout)
							.frame(maxWidth: .infinity)
							.padding(.bottom)
							.onTapGesture {
								withAnimation(.snappy) {
									liveVideoTab = tab
								}
							}
					}
				}
				.background {
					Capsule()
						.fill(.white.opacity(0.1))
						.frame(
							height: 2
						)
						.frame(
							maxWidth: .infinity,
							maxHeight: .infinity,
							alignment: .bottom
						)
				}
				.background {
					GeometryReader {
						let size = $0.size
						let lineWidth = size.width / CGFloat(LiveVideoTab.allCases.count)
						
						Capsule()
							.fill(scheme == .dark ? .white : .black)
							.frame(
								width: lineWidth,
								height: 2
							)
							.frame(
								maxHeight: .infinity,
								alignment: .bottom
							)
							.offset(
								x: tabProgress * (size.width - lineWidth)
							)
					}
				}
				
				ScrollView(.horizontal) {
					LazyHStack(spacing: 16) {
						VideoOverlayStatsView(boxscore.teams[0].statistics, boxscore.teams[1].statistics)
							.containerRelativeFrame(.horizontal)
						
						VideoOverlayStatsView(boxscore.teams[0].statistics, boxscore.teams[1].statistics)
							.containerRelativeFrame(.horizontal)
						
						VideoOverlayStatsView(boxscore.teams[0].statistics, boxscore.teams[1].statistics)
							.containerRelativeFrame(.horizontal)
					}
				}
				.scrollPosition(id: $liveVideoTab)
				.scrollIndicators(.hidden)
				.scrollTargetBehavior(.paging)
			}
			.background(
				.ultraThinMaterial,
				in: RoundedRectangle(cornerRadius: 16)
			)
			.frame(
				maxWidth: size.width / 2.5,
				maxHeight: .infinity,
				alignment: .topTrailing
			)
			.transition(.move(edge: .trailing).combined(with: .opacity))
			.animation(.smooth, value: showDetails)
		}
    }
}

import AVKit
#Preview {
	VideoPlayer(
		player:
				.init(
					url: URL(
						string: "https://media.video-cdn.espn.com/motion/2023/0914/dm_230914_dm_230914_FT_NFL_duos_pub2tag/dm_230914_dm_230914_FT_NFL_duos_pub2tag_360p30_1464k.mp4"
					)!
				)
	) {
		VideoOverlayInfoCard(
			.constant(true),
			.init(
				width: 800, height: 500)
			,
			BoxscoreModel.examples()[0]
		)
	}
}
