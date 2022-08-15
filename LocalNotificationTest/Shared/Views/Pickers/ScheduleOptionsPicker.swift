//
//  ScheduleOptionsPicker.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 15.08.22.
//

import SwiftUI


enum TriggerOptions: String, CaseIterable, Identifiable {
	case ScheduleIn = "Schedule In"
	case Date = "Date"
	
	var id: String { self.rawValue }
}

struct ScheduleOptionsPicker: View {
	
	@Binding var selectedTriggerOption: TriggerOptions
	
    var body: some View {
		Picker("Options", selection: $selectedTriggerOption) {
			ForEach(TriggerOptions.allCases) { option in
				Text(option.rawValue).tag(option)
			}
		}
		.pickerStyle(SegmentedPickerStyle())
    }
}

struct ScheduleOptionsPicker_Previews: PreviewProvider {
    static var previews: some View {
		ScheduleOptionsPicker(selectedTriggerOption: .constant(.ScheduleIn))
    }
}
