//
//  ScheduleAtPicker.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 07.08.22.
//

import SwiftUI

struct ScheduleAtPicker: View {
	
	@Binding var selectedDateOption: Date
	
    var body: some View {
		DatePicker("Please enter a date", selection: $selectedDateOption)
			.labelsHidden()
			.padding(.vertical)
    }
}

struct ScheduleAtPicker_Previews: PreviewProvider {
    static var previews: some View {
		ScheduleAtPicker(selectedDateOption: .constant(Date()))
    }
}
