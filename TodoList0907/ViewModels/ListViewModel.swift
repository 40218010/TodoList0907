//
//  ListViewModel.swift
//  TodoList0907
//
//  Created by 林大屍 on 2021/9/10.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create - addItem
 Read - getItem
 Update
 Delete

 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
//        let newItems = [
//            ItemModel(title: "Life is the sum of all your choices.", isCompleted: true),
//            ItemModel(title: "I do not believe in God and I am not an atheist.", isCompleted: false),
//            ItemModel(title: "I rebel; therefore I exist.", isCompleted: false),
//            ItemModel(title: "I may not have been sure about what really did interest me, but I was absolutely sure about what didn't.", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//       if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
