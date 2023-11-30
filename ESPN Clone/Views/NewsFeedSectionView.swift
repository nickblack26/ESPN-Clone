//
//  FeedSectionView.swift
//  ESPN Clone
//
//  Created by Nick on 9/16/23.
//

import SwiftUI



struct NewsFeedSectionView: View {
	var sport: Sport
	var articles: [ArticleModel]
	
    var body: some View {
		Section {
			VStack {
				ForEach(articles) { article in
					CardView(article: article)
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
					
					
					Text("STILL TIME TO SIGN UP AND PLAY!")
						.font(.caption)
						.foregroundStyle(.secondary)
				}
			}
			.foregroundStyle(.primary)
		}
		.listRowSeparator(.hidden)
		.listRowBackground(RoundedRectangle(cornerRadius: 25).fill(.white))
    }
}

//#Preview {
//	NewsFeedSectionView(sport: .fantasyFootball, articles: [testArticles[1]])
//}
