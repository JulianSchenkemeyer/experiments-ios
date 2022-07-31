//
//  ConfigureNotificationViewModel.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 31.07.22.
//

import Foundation
import UserNotifications


enum TriggerOptions: String, CaseIterable, Identifiable {
	case ScheduleIn = "Schedule In"
	case Date = "Date"
	
	var id: String { self.rawValue }
}

enum ScheduleInOptions: Int, CaseIterable, Identifiable {
	case ten = 10
	case twenty = 20
	case thirty = 30
	case fourty = 40
	case fifty = 50
	case sixty = 60
	case seventy = 70
	case eighty = 80
	
	var id: Int { Int(self.rawValue) }
}

final class ConfigureNotificationViewModel: ObservableObject {
	@Published var title = ""
	@Published var subtitle = ""
	@Published var msgBody = ""
	@Published var selectedTriggerOption: TriggerOptions = .ScheduleIn
	
	private let timeIntervalOptions = [10, 20, 30, 40, 50, 60]
	@Published var selectedTimeIntervalOption: Int = 10
	
	
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
		let interval = Double(selectedTimeIntervalOption)
		return UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
	}
}
