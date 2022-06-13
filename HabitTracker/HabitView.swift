//
//  HabitView.swift
//  HabitTracker
//
//  Created by Carson Gross on 6/12/22.
//

import SwiftUI

struct HabitView: View {
    let habit: Habit
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Section(header: Text(habit.title).frame(maxWidth: .infinity).padding().font(.title)) {
                        Text(habit.description)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                Spacer()
                Section {
                    Text("Current Completions: \(habit.completions)")
                        .font(.headline.bold())
                }
                Button(action: {
                    updateCompletions()
                }) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                        Text("Add Completion")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25)
                }
                .padding(.bottom)
            }
            .navigationTitle("Habit Details")
        }
    }
    func updateCompletions() {
        let newHabit = Habit(title: habit.title, description: habit.description, completions: (habit.completions + 1))
        if let index = habits.items.firstIndex(of: habit) {
            habits.items[index] = newHabit
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static let habit = Habit(title: "Test", description: "Test Descriptions", completions: 10)
    static let habits = Habits()
    
    static var previews: some View {
        HabitView(habit: habit, habits: habits)
    }
}
