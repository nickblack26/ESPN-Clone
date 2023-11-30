//
//  CompetitorView.swift
//  ESPN Clone
//
//  Created by Nick on 9/23/23.
//

import SwiftUI

enum CompetitorViewStyle {
	case horizontal
	case vertical
}

struct CompetitorView: View {
	var style: CompetitorViewStyle
	var logo: URL?
	var title: String
	var rank: Int?
	var record: String?
	
	init(style: CompetitorViewStyle = .horizontal, logo: URL?, title: String, rank: Int? = nil, record: String? = nil) {
		self.style = style
		self.logo = logo
		self.title = title
		self.rank = rank
		self.record = record
	}
	
    var body: some View {
		if style == .horizontal {
			HStack {
				AsyncImage(url: logo) { image in
					image
						.resizable()
						.scaledToFit()
						.frame(height: 25)
				} placeholder: {
					Image("Football_Logo")
						.resizable()
						.scaledToFit()
						.frame(height: 25)
				}
				
				if let rank {
					Text("\(rank)")
						.font(.caption)
						.foregroundStyle(.secondary)
				}
				
				Text(title)
					.lineLimit(1)
					.fontWeight(.medium)
			}
		} else {
			VStack {
				AsyncImage(url: logo) { image in
					image
						.resizable()
						.scaledToFit()
						.frame(maxHeight: 50)
				} placeholder: {
					Image("Football_Logo")
						.resizable()
						.scaledToFit()
						.frame(maxHeight: 50)
				}
				
				HStack {
					if let rank {
						Text("\(rank)")
							.font(.caption)
							.foregroundStyle(.secondary)
					}
					
					Text(title)
						.font(.caption)
						.lineLimit(1)
				}
				
				if let record {
					Text(record)
						.font(.caption)
				}
			}
		}
    }
}

#Preview {
	CompetitorView(style: .vertical, logo: URL(string: testTeams[0].logo)!, title: "Colorado", rank: 12, record: "3-0")
}
