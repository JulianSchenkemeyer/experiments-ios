//
//  NotificationStatusView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 24.07.22.
//

import SwiftUI

struct NotificationStatusView: View {
	
	@Binding var notificationsEnabled: Bool
	
    var body: some View {
		Text(notificationsEnabled ? "Notifications Enabled" : "Notifications Disabled")
			.font(.title3)
			.fontWeight(.semibold)
			.foregroundColor(notificationsEnabled ? .green : .red)
    }
}

struct NotificationStatusView_Previews: PreviewProvider {
    static var previews: some View {
		NotificationStatusView(notificationsEnabled: .constant(true))
    }
}
