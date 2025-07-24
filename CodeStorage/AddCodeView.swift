//
//  AddCodeView.swift
//  CodeStorage
//
//  Created by Shane McDonough on 7/23/25.
//

import SwiftUI

struct AddCodeView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) private var presentationMode
    @State private var name: String = ""
    @State private var code: String = ""
    
    var body: some View {
        VStack {
            Text("Add New Code")
            TextField("Name", text: $name)
                .onSubmit(addItem)
            TextField("Code", text: $code)
                .onSubmit(addItem)
            Button("Submit", action: addItem)
                .disabled(name == "" || code == "")
        }
    }
    
    private func addItem() {
        if name == "" || code == "" { return }
        withAnimation {
            let newItem = Code(name: name, code: code)
            modelContext.insert(newItem)
        }
        self.presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddCodeView()
}
