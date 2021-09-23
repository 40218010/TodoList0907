//
//  AddView.swift
//  TodoList0907
//
//  Created by 林大屍 on 2021/9/8.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle = ""
    @State var showAlert = false

    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type sth here....",
                          text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemFill).cornerRadius(10))
                
                Button(action: saveButtonPressed, label: {
                    Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor.cornerRadius(10))
                })
            }
            .padding()
        }
        .navigationTitle("Add new item🌈")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "字數要>3喔😉"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(ListViewModel())
    }
}
