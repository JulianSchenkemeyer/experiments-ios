//
//  Expense.swift
//  SwiftDataExample
//
//  Created by Julian Schenkemeyer on 05.10.23.
//

import Foundation
import SwiftData


@Model
class Expense {
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
