//
//  ListView.swift
//  TodoList0907
//
//  Created by 林大屍 on 2021/9/7.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }

        .navigationTitle("🔖Todo List")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("ADD",
                                                     destination: AddView()))
    }
    

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ListView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
            NavigationView {
                ListView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }

    }
}


