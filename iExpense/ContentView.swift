//
//  ContentView.swift
//  iExpense
//
//  Created by Burak Cüce on 28.07.22.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dissmiss
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dissmiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
