//
//  ContentView.swift
//  Shared
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
import UserNotifications

struct NotificationOverviewView: View {
	
	@StateObject var viewModel = NotificationOverviewModel()
	
	var body: some View {
		VStack(spacing: 20) {
			NotificationStatusView(notificationsEnabled: $viewModel.notificationsEnabled)
				.padding(.top)
			
			Spacer()
			
			if (viewModel.notificationsEnabled) {
				NTButton(title: "Configure Notification") {
					viewModel.showNoticationConfiguratorView = true
				}
			} else {
				RequestNotificationPermissionView(notificationsEnabled: $viewModel.notificationsEnabled)
			}
			
			Spacer()
		}
		.onAppear {
			viewModel.getNotificationStatus()		}
		.sheet(isPresented: $viewModel.showNoticationConfiguratorView) {
			ConfigureNotificationView(isShowing: $viewModel.showNoticationConfiguratorView)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		NotificationOverviewView()
	}
}
