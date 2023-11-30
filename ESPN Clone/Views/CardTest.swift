//
//  CardTest.swift
//  ESPN Clone
//
//  Created by Nick on 9/24/23.
//

import SwiftUI

struct CardTest<C: View>: View {
	let title: String?
	let content: C
	
	init(title: String? = nil, _ content: () -> (C)) {
		self.title = title
		self.content = content()
	}
	
	var body: some View {
		VStack(alignment: .leading) {
			if let title {
				Text(title)
					.fontWeight(.bold)
				
				Divider()
			}
			content
		}
		.frame(maxWidth: .infinity)
		.padding()
		.background(.secondary.opacity(0.1))
		.clipShape(RoundedRectangle(cornerRadius: 25.0))
	}
}

#Preview {
	CardTest(title: "Test") {
		Text("Hi")
	}
}
