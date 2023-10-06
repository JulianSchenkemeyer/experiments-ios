//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Julian Schenkemeyer on 05.10.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isShowingItemSheet = false
    @Query(sort: \Expense.date) var expenses: [Expense]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    Text(expense.name)
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) { AddExpenseSheet() }
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list.")
                    }, actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

struct AddExpenseSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $value, format: .currency(code: "Eur"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") { 
                        let expense = Expense(name: name, date: date, value: value)
                        context.insert(expense)
                        
//                        try! context.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
