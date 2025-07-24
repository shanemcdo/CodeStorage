//
//  ContentView.swift
//  CodeStorage
//
//  Created by Shane McDonough on 7/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Code]
    
    @ViewBuilder
    var list: some View {
        if items.isEmpty {
            Text("No Items to Display")
        } else {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack {
                            Text(item.name)
                            Text(item.code)
                        }
                    } label: {
                        Text(item.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            list.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink {
                        AddCodeView()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Code.self, inMemory: true)
}
