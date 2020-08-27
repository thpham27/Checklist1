//
//  RowView.swift
//  Checklist
//
//  Created by Thanh Pham on 8/26/20.
//  Copyright © 2020 Thanh Pham. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
        HStack {
            Text(checklistItem.name)
            Spacer()
            Text(checklistItem.isChecked ? "✅" : "🔲")
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
}
}
}
