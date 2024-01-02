//
//  ContentView.swift
//  iExpensive
//
//  Created by Luis Rivera on 01/01/24.
//

import SwiftUI


struct SecondView : View {
    @Environment(\.dismiss) var dismiss
    
    
    let name : String
    var body: some View {
        Text(name)
        
        Button("Dismis"){
            dismiss()
        }
    }
}

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var showingSheet  = false
    
   
    var body: some View {
        Button("Show sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "hellow world!11")
        })
    }
}

#Preview {
    ContentView()
}
