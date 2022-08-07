//
//  LocalNotificationTestApp.swift
//  Shared
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
import UserNotifications


class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		// Show local notification in foreground
		UNUserNotificationCenter.current().delegate = self
		
		return true
	}
}
// Conform to UNUserNotificationCenterDelegate to show local notification in foreground
extension AppDelegate: UNUserNotificationCenterDelegate {
	// Handle actions triggered by the user on the notification
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
		print(response)
	}
	
	// Handle notifications received when the app is in foreground
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
		// Show only a badge when the app is in foreground
		return [.badge]
	}
}

@main
struct LocalNotificationTestApp: App {
	
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
            NotificationOverviewView()
        }
    }
}
