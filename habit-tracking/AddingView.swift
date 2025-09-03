//
//  AddingView.swift
//  habit-tracking
//
//  Created by MacRow on 03/09/2025.
//

import SwiftUI

struct AddingView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var habbit = ""
    
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Habbit", text: $habbit)
            }
        }
    }
}

#Preview {
    AddingView()
}
