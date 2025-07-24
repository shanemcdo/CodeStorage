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
    @State private var code: String?
    @State private var isScanning: Bool = false
    
    var body: some View {
        VStack {
            Text("Add New Code")
            TextField("Name", text: $name)
                .onSubmit(addItem)
            Button("Scan") {
                isScanning = true
            }
            .fullScreenCover(isPresented: $isScanning) {
                BarcodeScannerView { c in
                    code = c
                    isScanning = false
                }
            }
            Button("Submit", action: addItem)
                .disabled(name == "" || code == "")
        }
    }
    
    private func addItem() {
        if let code = code {
            withAnimation {
                let newItem = Code(name: name, code: code)
                modelContext.insert(newItem)
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    AddCodeView()
}
