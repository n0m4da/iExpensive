//
//  storeModels.swift
//  iExpensive
//
//  Created by Luis Rivera on 02/01/24.
//

import SwiftUI

struct Person: Codable {
    let firstName : String
    let lastName : String
}

struct storeModels: View {
    //MARK: - PROPERTIES
    @State private var user = Person(firstName: "odius", lastName: "nomad")
    //MARK: - BODY
    var body: some View {
        Button("Save person"){
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.setValue(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    storeModels()
}
