//
//  NTButton.swift
//  LocalNotificationTest
//
//  Created by Julian Schenkemeyer on 24.07.22.
//

import SwiftUI

struct NTButton: View {
	
	var title: String
	var action: () -> Void
	
    var body: some View {
		Button {
			action()
		} label: {
			Text(title)
				.frame(width: 200, height: 50)
		}
		.buttonStyle(.bordered)
		.tint(.blue)
		.frame(width: 200, height: 50)
    }
}

struct NTButton_Previews: PreviewProvider {
	static func test() -> Void {
		print("button pressed")
	}
	
    static var previews: some View {
		
		
		NTButton(title: "Test", action: test)
    }
}
