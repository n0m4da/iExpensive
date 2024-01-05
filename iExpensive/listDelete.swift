//
//  listDelete.swift
//  iExpensive
//
//  Created by Luis Rivera on 03/01/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() // not garante they will be unique but is high chance never repeated
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses{
    var items = [ExpenseItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
     
        }
    
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
            items = []
    }
}

struct listDelete: View {
    //MARK: -
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
  
    
    //MARK: - BODY
    var body: some View {
        NavigationStack{
            var personalItems: [ExpenseItem] {
                expenses.items.filter { $0.type == "Personal" }
                }
            var businesItems: [ExpenseItem]{
                expenses.items.filter{$0.type == "Business"}
            }
            List {
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            HStack {
                                Text(item.name)
                                    .font(.headline)

                                Spacer()

                                Text(item.amount, format: .currency(code: Locale.current.identifier ))
                                    .foregroundStyle(item.amount < 10 ? .black
                                                     : item.amount>20 ? .red: .blue)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Business Expenses")
                }

                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            HStack {
                                Text(item.name)
                                    .font(.headline)

                                Spacer()

                                Text(item.amount, format: .currency(code: Locale.current.identifier ))
                                    .foregroundStyle(item.amount < 10 ? .black
                                                     : item.amount>20 ? .red: .blue)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Personal Expenses")
                }
            }
            .navigationTitle("iExpenses")
            .toolbar{
                Button("Add Expenses", systemImage: "plus"){
//                    let expense = ExpenseItem(name: "Text", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    listDelete()
}
