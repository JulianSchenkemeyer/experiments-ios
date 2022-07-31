//
//  NotificationOverviewViewModel.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 31.07.22.
//

import Foundation
import UserNotifications


final class NotificationOverviewModel: ObservableObject {
	@Published var notificationsEnabled = false
	@Published var showNoticationConfiguratorView = false
	

	func getNotificationStatus() {
		UNUserNotificationCenter.current().requestAuthorization { granted, error in
			
			print("Can receive notifications: \(granted)")
			DispatchQueue.main.async { [self] in
				notificationsEnabled = granted
			}
			
		}
	}
}
