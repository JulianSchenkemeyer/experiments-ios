//
//  ConfigureNotificationViewModel.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 31.07.22.
//

import Foundation
import UserNotifications


final class ConfigureNotificationViewModel: ObservableObject {
	@Published var title = ""
	@Published var subtitle = ""
	@Published var msgBody = ""
	@Published var selectedTriggerOption: TriggerOptions = .ScheduleIn
	
//	private let timeIntervalOptions = [10, 20, 30, 40, 50, 60]
	@Published var selectedScheduleInOption: Int = 30
	@Published var selectedScheduleAtOption: Date = Date()
	
	
	func configureNotification() {
		// Configure the content of the Notification
		let content = configureContent()
		let trigger = configureIntervalTrigger()
		
		NotificationHelper.scheduleNotification(content, with: trigger)
	}
	
	private func configureContent() -> UNMutableNotificationContent {
		let content = UNMutableNotificationContent()
		content.title = title
		content.subtitle = subtitle
		content.body = msgBody
		
		return content
	}
	
	private func configureIntervalTrigger() -> UNNotificationTrigger {
		let interval = Double(selectedScheduleInOption)
		return UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
	}
}
