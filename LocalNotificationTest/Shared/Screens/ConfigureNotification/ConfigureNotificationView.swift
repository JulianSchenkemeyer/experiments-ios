//
//  ConfigureNotificationView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 17.07.22.
//

import SwiftUI
import UserNotifications


struct ConfigureNotificationView: View {
	
	@StateObject var viewModel = ConfigureNotificationViewModel()
	@Binding var isShowing: Bool
	
	var body: some View {
		VStack {
			Form {
				Section("Message") {
					TextField("Title", text: $viewModel.title)
					TextField("Subtitle", text: $viewModel.subtitle)
					
					TextEditor(text: $viewModel.msgBody)
				}
				
				Section("Trigger") {
					ScheduleOptionsPicker(selectedTriggerOption: $viewModel.selectedTriggerOption)
					
					if viewModel.selectedTriggerOption == .ScheduleIn {
						
						ScheduleInPicker(selectedScheduleInOption: $viewModel.selectedScheduleInOption)
					} else {
						ScheduleAtPicker(selectedDateOption: $viewModel.selectedScheduleAtOption)
					}
				}
				
				NTFormSubmitButton {
					viewModel.configureNotification()
					isShowing = false
				}
			}
		}
	}
}

struct ConfigureNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfigureNotificationView(isShowing: .constant(true))
	}
}
