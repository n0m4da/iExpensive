//
//  DeletingItems.swift
//  iExpensive
//
//  Created by Luis Rivera on 01/01/24.
//

import SwiftUI

struct DeletingItems: View {
    //MARK: - PROPERTIES
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    //MARK: - BODY
    var body: some View {
        
        NavigationStack{
            
            VStack{
                List{
                    ForEach(numbers, id:\.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar{
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeletingItems()
}
