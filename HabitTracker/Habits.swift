//
//  Habits.swift
//  HabitTracker
//
//  Created by Carson Gross on 6/12/22.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Itmes")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
