//
//  MainSettingsView.swift
//  ESPN Clone
//
//  Created by Nick on 9/16/23.
//

import SwiftUI

struct MainSettingsView: View {
	
	
    var body: some View {
		List {
			Section {
				NavigationLink {
					
				} label: {
					Text("Preferences and Alerts")
				}
				
				NavigationLink {
					
				} label: {
					Text("Edition")
				}
				
				NavigationLink {
					
				} label: {
					Text("Default Tab")
				}
				
				NavigationLink {
					
				} label: {
					Text("Video Settings")
				}
			}
			
			Section {
				Button {
					
				} label: {
					Text("Log Out of ESPN Account")
				}
				
				NavigationLink {
					
				} label: {
					Text("Account Details")
				}
				
				NavigationLink {
					
				} label: {
					Text("TV Provider")
				}
				
				NavigationLink {
					
				} label: {
					Text("ESPN+ Subscriptions")
				}
				
				NavigationLink {
					
				} label: {
					Text("Contact Support")
				}
			}
			
			Section {
				NavigationLink {
					
				} label: {
					Text("About ESPN")
				}
				
				NavigationLink {
					
				} label: {
					Text("Privacy Policty")
				}
				
				NavigationLink {
					
				} label: {
					Text("Do Not Sell My Personal Information")
				}
			}
		}
		.navigationTitle("Settings")
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	NavigationStack {
		MainSettingsView()
	}
}
