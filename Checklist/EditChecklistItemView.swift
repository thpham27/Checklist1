//
//  EditChecklistItemView.swift
//  Checklist
//
//  Created by Thanh Pham on 8/25/20.
//  Copyright © 2020 Thanh Pham. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    //Properties
    //==========
    
    @Binding var checklistItem: ChecklistItem
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Complete", isOn:  $checklistItem.isChecked)
        }
    }
}
    // Preview
    //=======
struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
