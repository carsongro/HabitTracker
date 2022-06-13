//
//  AddView.swift
//  HabitTracker
//
//  Created by Carson Gross on 6/12/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var completions = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Habit")
            .toolbar {
                Button("Save") {
                    let item = Habit(title: title, description: description, completions: completions)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
