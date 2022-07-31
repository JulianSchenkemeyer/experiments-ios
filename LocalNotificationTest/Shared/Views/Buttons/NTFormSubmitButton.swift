//
//  NTSubmitButton.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 24.07.22.
//

import SwiftUI

struct NTFormSubmitButton: View {
	
	var action: () -> Void
	
	var body: some View {
		Section {
			Button {
				action()
			} label: {
				HStack {
					Spacer()
					Label("Schedule Notification", systemImage: "paperplane")
					Spacer()
				}
			}
			.buttonStyle(.bordered)
			.tint(.blue)
		}
		.listRowBackground(Color.clear)
	}
}

struct NTSubmitButton_Previews: PreviewProvider {
	static var previews: some View {
		NTFormSubmitButton(action: {})
	}
}
