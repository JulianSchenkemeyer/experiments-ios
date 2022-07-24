//
//  RequestNotificationPermissionView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 24.07.22.
//

import SwiftUI
import UserNotifications


struct RequestNotificationPermissionView: View {
    var body: some View {
		NTButton(title: "Request Permission") {
			NotificationHelper.requestNotificationPermission()
		}
    }
}

struct RequestNotificationPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        RequestNotificationPermissionView()
    }
}
