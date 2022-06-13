//
//  Habit.swift
//  HabitTracker
//
//  Created by Carson Gross on 6/12/22.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    let completions: Int
}
