//
//  ContentView.swift
//  ESPN Clone
//
//  Created by Nick on 9/14/23.
//

import SwiftUI

struct ContentView: View {
	@State private var openSheet: Bool = false
	
    var body: some View {
		TabView {
			NavigationStack {
				HomeView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationDestination(for: EventModel.self, destination: { event in
						EventDetailView(event: event)
					})
					.toolbar {
						ToolbarItem(placement: .topBarLeading) {
							Button {
								
							} label: {
								Image(systemName: "magnifyingglass")
							}
						}
						
						ToolbarItem(placement: .principal) {
							Image("ESPN_Logo")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(maxHeight: 20)
						}
						
						ToolbarItem {
							Button {
								openSheet.toggle()
							} label: {
								Image(systemName: "gearshape")
							}
						}
					}
					.tint(.white)
					.toolbarBackground(.visible, for: .navigationBar)
					.toolbarBackground(.primary)

			}
			.tabItem {
				Label("Home", systemImage: "house")
			}
			.sheet(isPresented: $openSheet) {
				NavigationStack {
					MainSettingsView()
						.toolbar {
							ToolbarItem {
								Button {
									openSheet.toggle()
								} label: {
									Image(systemName: "xmark")
								}
							}
						}
				}
			}
			
			NavigationStack {
				ScoreboardListView(sport: .hockey)
					.navigationDestination(for: CompetitionModel.self) { competition in
						CompetitionDetailView(competition)
					}
			}
			.tabItem {
				Label("Scores", systemImage: "sportscourt")
			}
		}
    }
}

#Preview {
    ContentView()
}
