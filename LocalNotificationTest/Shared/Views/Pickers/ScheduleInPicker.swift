//
//  SwiftUIView.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 07.08.22.
//

import SwiftUI


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

struct ScheduleInPicker: View {
	
	@Binding var selectedScheduleInOption: Int
	
    var body: some View {
		Picker("Seconds", selection: $selectedScheduleInOption) {
			ForEach(ScheduleInOptions.allCases) {
				option in
				Text("\(option.rawValue)").tag(option.rawValue)
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
