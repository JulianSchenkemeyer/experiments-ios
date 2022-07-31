//
//  ContentView.swift
//  Shared
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
import UserNotifications

struct NotificationOverviewView: View {
	
	@State private var notificationsEnabled = false
	@State private var showNoticationConfiguratorView = false
	
	var body: some View {
		VStack(spacing: 20) {
			NotificationStatusView(notificationsEnabled: $notificationsEnabled)
				.padding(.top)
			
			Spacer()
			
			NTButton(title: "Configure Notification") {
				showNoticationConfiguratorView = true
			}
			
			Spacer()
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
		NotificationOverviewView()
	}
}
