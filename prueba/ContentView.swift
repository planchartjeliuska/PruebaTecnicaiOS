
//
//  ContentView.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : MainViewModel = MainViewModel()
    
    
    
    var body: some View {
        NavigationSplitView {
            List(
                viewModel.responseUsers,
                id: \.id
            ){user in
                NavigationLink{
                    DetailUser(user: user)
                }label: {
                    itemUsers(user: user)
                }
            }
            .navigationTitle("USUARIOS")
            
        } detail: {
            
        }
        
        .onAppear{
            viewModel.getUsers()
        }
    }
}

#Preview {
    ContentView()
}
