//
//  VideoView.swift
//  ESPN Clone
//
//  Created by Nick on 9/14/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
	var title: String?
	var subtitle: String?
	var description: String?
	var videoUrl: String?
	@State var player: AVPlayer? = nil
	
	init(
		title: String? = nil,
		subtitle: String? = nil,
		description: String? = nil,
		videoUrl: String? = nil
	) {
		if let videoUrl {
			let playerItem = AVPlayerItem(url: URL(string: videoUrl)!)
			var externalMetaData: [AVMetadataItem] = []
			
			if let title {
				let titleItem = AVMutableMetadataItem()
				titleItem.identifier = .commonIdentifierTitle
				titleItem.value = title as NSString
				externalMetaData.append(titleItem)
			}
			
			if let subtitle {
				let subtitleItem = AVMutableMetadataItem()
				subtitleItem.identifier = .iTunesMetadataTrackSubTitle
				subtitleItem.value = subtitle as NSString
				externalMetaData.append(subtitleItem)
			}
			
			if let description {
				let infoItem = AVMutableMetadataItem()
				infoItem.identifier = .commonIdentifierDescription
				infoItem.value = description as NSString
				externalMetaData.append(infoItem)
			}
			
			playerItem.externalMetadata = externalMetaData
			
			self.player = AVPlayer(playerItem: playerItem)
//			let interstitialsController: AVPlayerInterstitialEventController = .init(primaryPlayer: player!)
//			interstitialsController.events = [.init(primaryItem: playerItem, time: .zero)]
		}
	}
	
    var body: some View {
		VideoPlayer(player: player)
//		if let player {
//		} else {
//			VideoPlayer(player: AVPlayer(url: URL(string: videoUrl ?? "https://media.video-cdn.espn.com/motion/2023/0914/dm_230914_dm_230914_FT_NFL_duos_pub2tag/dm_230914_dm_230914_FT_NFL_duos_pub2tag_360p30_1464k.mp4")!))
//		}
    }
}

#Preview {
	VideoView(title: "First Take", subtitle: "Better Duo: Cousins & Jefferson or Hurts & Brown", description: "Stephen A. Smith and Mina Kimes disagree on whether Jalen Hurts-A.J. Brown or Kirk Cousins-Justin Jefferson is the best QB-WR duo in the NFL.", videoUrl: "https://media.video-cdn.espn.com/motion/2023/0914/dm_230914_dm_230914_FT_NFL_duos_pub2tag/dm_230914_dm_230914_FT_NFL_duos_pub2tag_360p30_1464k.mp4")
}
