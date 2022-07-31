//
//  NotificationOverviewViewModel.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 31.07.22.
//

import Foundation


final class NotificationOverviewModel: ObservableObject {
	@Published var notificationsEnabled = false
	@Published var showNoticationConfiguratorView = false
}
