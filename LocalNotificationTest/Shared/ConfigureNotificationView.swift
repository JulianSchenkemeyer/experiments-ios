//
//  ConfigureNotificationView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
import UserNotifications

struct ConfigureNotificationView: View {
	
	@State private var title = ""
	@State private var subtitle = ""
	@State private var msgBody = ""
	
	var body: some View {
		VStack {
			Form {
				Section("Message") {
					TextField("Title", text: $title)
					TextField("Subtitle", text: $subtitle)
					
					TextEditor(text: $msgBody)
				}
			}
			
			Button {
				let content = UNMutableNotificationContent()
				content.title = title
				content.subtitle = subtitle
				content.body = msgBody
				
				// show this notification five seconds from now
				let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
				
				// choose a random identifier
				let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
				
				// add our notification request
				UNUserNotificationCenter.current().add(request)
			} label: {
				Label("Submit", systemImage: "paperplane")
			}
			.buttonStyle(.borderless)
		}
	}
}

struct ConfigureNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfigureNotificationView()
	}
}
