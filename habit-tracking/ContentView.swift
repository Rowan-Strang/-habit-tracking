//
//  ContentView.swift
//  habit-tracking
//
//  Created by MacRow on 03/09/2025.
//

import SwiftUI

struct HabbitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let timeMinutes: Int
}

@Observable
class Habbits{
    var items = [HabbitItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabbitItem].self,
                from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    
    @State private var habbits = Habbits()
    
    var body: some View {
        NavigationStack {
            List {
                Text("Nothing")
            }
            .navigationTitle("Habbiter")
            .toolbar{
                NavigationLink {
                    AddingView()
                } label: {
                    Image (systemName: "plus")
            }
            }
            
        }
            }
    
        }

#Preview {
    ContentView()
}
