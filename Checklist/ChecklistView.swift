//
//  ContentView.swift
//  Checklist
//
//  Created by Thanh Pham on 8/24/20.
//  Copyright © 2020 Thanh Pham. All rights reserved.
//

import SwiftUI

struct ChecklistView: View {
    
    //Properties
    //============
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    //user interface content and layout
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { index in
                    RowView(checklistItem: self.$checklist.items[index])
                }
                
                
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
                
            }
            .navigationBarItems(
                leading: Button(action: { self.newChecklistItemViewIsVisible = true }) {
                Image(systemName: "plus")
            },
            trailing: EditButton())
            .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear() {
            self.checklist.printChecklistContents()
                self.checklist.saveListItem()
                
            }
    }
        
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist)
        }
}
    
    //Methods
    //=========
}
    //Preview
    //=========
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ChecklistView()
        }
    }
    

