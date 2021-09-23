//
//  TodoList0907App.swift
//  TodoList0907
//
//  Created by 林大屍 on 2021/9/7.
//

import SwiftUI

/*
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct TodoList0907App: App {
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
