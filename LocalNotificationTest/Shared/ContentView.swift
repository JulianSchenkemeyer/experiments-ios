//
//  ContentView.swift
//  Shared
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
	
	@State private var notificationsEnabled = false
	@State private var showNoticationConfiguratorView = false
	
	var body: some View {
		VStack(spacing: 20) {
			Text(notificationsEnabled ? "Notifications Enabled" : "Notifications Disabled")
				.font(.title3)
				.fontWeight(.semibold)
				.foregroundColor(notificationsEnabled ? .green : .red)
			
			if (!notificationsEnabled) {
				Button {
					print("Test")
					
					UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
						
						
						if success {
							print("all set!")
							notificationsEnabled = true
						} else if let error = error {
							print(error.localizedDescription)
						}
					}
				} label: {
					Text("Request Permission")
						.padding()
				}
				.buttonStyle(.bordered)
				.tint(.blue)
			}
			
			Button {
				showNoticationConfiguratorView = true
			} label: {
				Text("Schedule Notification")
					.padding()
			}
			.buttonStyle(.bordered)
			.tint(.blue)
		}
		.onAppear {
			UNUserNotificationCenter.current().requestAuthorization { granted, error in
				
				print("Can receive notifications: \(granted)")
				notificationsEnabled = granted
			}
		}
		.sheet(isPresented: $showNoticationConfiguratorView) {
			ConfigureNotificationView()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
