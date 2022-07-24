//
//  ConfigureNotificationView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
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

struct ConfigureNotificationView: View {
	
	@State private var title = ""
	@State private var subtitle = ""
	@State private var msgBody = ""
	
	@State private var selectedTriggerOption: TriggerOptions = .ScheduleIn
	
	private let timeIntervalOptions = [10, 20, 30, 40, 50, 60]
	@State private var selectedTimeIntervalOption: Int = 10
	
	var body: some View {
		VStack {
			Form {
				Section("Message") {
					TextField("Title", text: $title)
					TextField("Subtitle", text: $subtitle)
					
					TextEditor(text: $msgBody)
				}
				
				Section("Trigger") {
					Picker("Options", selection: $selectedTriggerOption) {
						ForEach(TriggerOptions.allCases) { option in
							Text(option.rawValue).tag(option)
						}
					}
					.pickerStyle(SegmentedPickerStyle())
					
					if (selectedTriggerOption == .ScheduleIn) {
						
						Picker("Seconds", selection: $selectedTimeIntervalOption) {
							ForEach(ScheduleInOptions.allCases) {
								option in
								Text("\(option.rawValue)").tag(option.rawValue)
							}
						}
						.pickerStyle(WheelPickerStyle())
					}
				}
				
				NTFormSubmitButton {
					// Configure the content of the Notification
					let content = UNMutableNotificationContent()
					content.title = title
					content.subtitle = subtitle
					content.body = msgBody
					
					// show this notification five seconds from now
					let interval = Double(selectedTimeIntervalOption)
					let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
					
					NotificationHelper.scheduleNotification(content, with: trigger)
				}
			}
		}
	}
}

struct ConfigureNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfigureNotificationView()
	}
}
