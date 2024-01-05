//
//  AddView.swift
//  iExpensive
//
//  Created by Luis Rivera on 03/01/24.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    
    var expenses: Expenses
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id:\.self){
                        Text($0)
                    }
                }.pickerStyle(.automatic)
                
                
                TextField("Amount", value: $amount, format: .currency(code: "MXN"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
