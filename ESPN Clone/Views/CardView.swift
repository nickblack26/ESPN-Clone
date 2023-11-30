//
//  CardView.swift
//  ESPN Clone
//
//  Created by Nick on 9/14/23.
//

import SwiftUI
import AVKit

enum ImageType: Hashable, Codable {
	case header
}

enum ArticleType: Hashable {
	case HeadlineNews
	case Media
	case Story
}

struct ImageModel: Codable {
	var id: Int
	var url: String
	var name: String
	var width: CGSize?
	var height: CGSize?
	var credit: String?
	var type: ImageType?
	var alt: String?
}

struct ArticleModel: Identifiable {
	var id: UUID = UUID()
	var description: String
	var type: ArticleType
	var premium: Bool
	var headline: String
	var byline: String
	var published: Date
	var lastModified: Date
	var story: String?
	var images: [ImageModel]
}

struct CardView: View {
	var isHeader: Bool
	var article: ArticleModel
	@State var player: AVPlayer? = nil
	
	init(isHeader: Bool = false, article: ArticleModel, player: AVPlayer? = nil) {
		self.isHeader = isHeader
		self.article = article
		
		if article.type == .Media {
			//			let playerItem: AVPlayerItem = .init(url: URL(string: videoUrl)!)
			//
			//			let titleItem = AVMutableMetadataItem()
			//			titleItem.identifier = .commonIdentifierTitle
			//			titleItem.value = NSString(string: title)
			//
			//			let subtitleItem = AVMutableMetadataItem()
			//			subtitleItem.identifier = .iTunesMetadataTrackSubTitle
			//			subtitleItem.value = NSString(string: title)
			//
			//			let infoItem = AVMutableMetadataItem()
			//			infoItem.identifier = .commonIdentifierDescription
			//			infoItem.value = NSString(string: title)
			//
			//			playerItem.externalMetadata = [titleItem, subtitleItem, infoItem]
			//
			//			self.player = AVPlayer(playerItem: playerItem)
		}
	}
	
	var body: some View {
		NavigationLink {
			ArticleDetailView(title: article.headline, story: article.story ?? "")
		} label: {
			VStack {
				AsyncImage(url: URL(string: article.images[0].url)) { image in
					image
						.resizable()
						.scaledToFill()
						.frame(maxHeight: isHeader ? 350 : 150)
				} placeholder: {
					Image(systemName: "gearshape")
				}
				
				
				VStack(alignment: .leading) {
					Text(article.headline)
						.fontWeight(.semibold)
					
					HStack {
						if article.premium {
							Image("ESPN_Plus_Logo")
								.resizable()
								.scaledToFit()
								.frame(maxHeight: 10)
						}
						Text("5h • \(article.byline)")
					}
					.font(.footnote)
					.foregroundStyle(.secondary)
				}
				.padding()
			}
			.border(isHeader ? .clear : .gray.opacity(0.1))
			.clipShape(RoundedRectangle(cornerRadius: isHeader ? 0 : 12.5))
		}
		
	}
}

#Preview {
	CardView(article: testArticles[0])
}
