//
//  Item.swift
//  CodeStorage
//
//  Created by Shane McDonough on 7/23/25.
//

import Foundation
import SwiftData

@Model
final class Code {
    var name: String
    var code: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
}
