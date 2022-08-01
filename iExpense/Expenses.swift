//
//  Expenses.swift
//  iExpense
//
//  Created by Burak Cüce on 01.08.22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
