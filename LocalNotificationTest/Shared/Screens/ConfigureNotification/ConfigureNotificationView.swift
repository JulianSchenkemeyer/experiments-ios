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
					Picker("Options", selection: $viewModel.selectedTriggerOption) {
						ForEach(TriggerOptions.allCases) { option in
							Text(option.rawValue).tag(option)
						}
					}
					.pickerStyle(SegmentedPickerStyle())
					
					if (viewModel.selectedTriggerOption == .ScheduleIn) {
						
						Picker("Seconds", selection: $viewModel.selectedTimeIntervalOption) {
							ForEach(ScheduleInOptions.allCases) {
								option in
								Text("\(option.rawValue)").tag(option.rawValue)
							}
						}
						.pickerStyle(WheelPickerStyle())
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
