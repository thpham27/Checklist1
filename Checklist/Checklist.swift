//
//  Checklist.swift
//  Checklist
//
//  Created by Thanh Pham on 8/25/20.
//  Copyright © 2020 Thanh Pham. All rights reserved.
//

import Foundation
class Checklist: ObservableObject {
    
    @Published var items =  [
    ChecklistItem(name: "Walk the dog", isChecked: false),
    ChecklistItem(name: "Brush  my teeth", isChecked: false),
    ChecklistItem(name: "Learn iOs development", isChecked: true),
    ChecklistItem(name: "Soccer practice", isChecked: false),
    ChecklistItem(name: "Eat ice cream",  isChecked: false),
    ]

    //Methods
    init() {
        print("Documents directory  is:  \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
    }
func printChecklistContents() {
    for item in items {
        print(item)
    }
}
func deleteListItem(whichElement: IndexSet) {
    items.remove(atOffsets: whichElement)
    printChecklistContents()
    saveListItems()
}
func moveListItem(whichElement: IndexSet, destination: Int) {
    items.move(fromOffsets: whichElement, toOffset: destination)
    printChecklistContents()
    }
}

func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory,
                                         in:. userDomainMask)
    return paths[0]
}
func dataFilePath() -> URL {
    return
        documentsDirectory().appendingPathComponent("Checklist.plist")
}
func saveListItems() {
    // 1
    let encoder = PropertyListDecoder()
    //  2
    do {
        // 3
        let  data =  try encoder.encode(items)
        //4
        try data.write(to: dataFilePath(),
                       options: Data.WritingOptions.atomic)
        // 5
    } catch {
        // 6
        print("Error endoding   item  array: \(error.localizedDescription)")
    }
}
