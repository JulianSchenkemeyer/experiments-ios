//
//  NotificationHelper.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 24.07.22.
//

import Foundation
import UserNotifications


final class NotificationHelper {
	
	// TODO: Convert to async method
	static func checkNotificationPermissionStatus() {
		UNUserNotificationCenter.current().requestAuthorization { granted, error in
			print("Can receive notifications: \(granted)")
		}
	}
	
	static func requestNotificationPermission() {
		
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
			if success {
				print("all set!")
			} else if let error = error {
				print(error.localizedDescription)
			}
		}
	}
	
	static func scheduleNotification(_ content: UNMutableNotificationContent, with trigger: UNNotificationTrigger) {
		// choose a random identifier
		let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
		
		// add our notification request
		UNUserNotificationCenter.current().add(request)
	}

}
