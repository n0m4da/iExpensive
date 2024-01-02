//
//  Store.swift
//  iExpensive
//
//  Created by Luis Rivera on 02/01/24.
//

import SwiftUI

struct Store: View {
    //MARK: - PROPERTIES
   // @State private var tapCount = //UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    //MARK: - BODY
    var body: some View {
        Button("Tap count: \(tapCount)"){
            tapCount += 1
            
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//            
//            print(UserDefaults.standard.integer(forKey: "Tap"))
        }
    }
}

#Preview {
    Store()
}
