//
//  ContentView.swift
//  iExpense
//
//  Created by Burak Cüce on 28.07.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text("€\(item.amount)")
                            .foregroundColor(
                                item.amount < 10 ? .green :
                                    item.amount >= 100 ? .red : nil
                            )
                    }
                }
                .onDelete(perform: removeItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to dest: Int) {
        expenses.items.move(fromOffsets: source, toOffset: dest)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
