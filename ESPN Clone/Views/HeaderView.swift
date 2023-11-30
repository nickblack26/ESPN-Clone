//
//  HeaderView.swift
//  ESPN Clone
//
//  Created by Nick on 9/24/23.
//

import SwiftUI
import AVKit

struct HeaderView: View {
	@State private var player: AVPlayer = .init(playerItem: .init(url: URL(string: "https://media.video-cdn.espn.com/motion/2023/0924/dm_230924_bijan_robinson_feature/dm_230924_bijan_robinson_feature_360p30_1464k.mp4")!))
	
    var body: some View {
		VStack(alignment: .leading) {
			VideoPlayer(player: player)
				.aspectRatio(contentMode: .fit)
//				.frame(maxHeight: 250)
			
			HStack {
				AsyncImage(url: URL(string: testTeams[0].logo)) { image in
					image
						.resizable()
						.scaledToFit()
						.frame(width: 50, height: 50)
				} placeholder: {
					Image(systemName: "gearshape")
				}
				
				Text("Bijan Robinson's upbringing was a work of art")
					.fontWeight(.medium)
					.lineLimit(2)
			}
			.padding(.horizontal)
			
		}
		.background {
			UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 15, bottomTrailing: 15))
				.fill(.regularMaterial)
		}
    }
}

#Preview {
    HeaderView()
}
