//
//  SwiftUIView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 07.08.22.
//

import SwiftUI


struct ScheduleInPicker: View {
	
	@Binding var selectedScheduleInOption: Int
	
	var body: some View {
		Picker("Seconds", selection: $selectedScheduleInOption) {
			ForEach(1 ..< 31) { i in
				let timesTen = i * 10
				Text("\(timesTen) seconds").tag(timesTen)
			}
		}
		.pickerStyle(WheelPickerStyle())
	}
}

struct SwiftUIView_Previews: PreviewProvider {
	static var previews: some View {
		ScheduleInPicker(selectedScheduleInOption: .constant(30))
	}
}
