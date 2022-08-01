//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Burak Cüce on 01.08.22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
