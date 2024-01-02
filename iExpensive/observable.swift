//
//  observable.swift
//  iExpensive
//
//  Created by Luis Rivera on 01/01/24.
//

import Observation
import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct observable: View {
    @State private var user = User()
    var body: some View {
        VStack {
            Text("Your name is \( user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            
        }
        .padding()
    }
}

#Preview {
    observable()
}
