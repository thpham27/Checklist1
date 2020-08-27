//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Thanh Pham on 8/25/20.
//  Copyright © 2020 Thanh Pham. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var isChecked :  Bool = false
}
