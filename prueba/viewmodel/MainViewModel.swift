//
//  MainViewModel.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import Foundation

class MainViewModel: ObservableObject{
    
    @Published var responseUsers: ResponseUsers = []
    
    
    func getUsers(){
        ApiService.shared.getUsers(
            onComplete: {
                responseUsers in
                self.responseUsers = responseUsers
            },
            onError: {
                error in
            }
        )
    }
    
}

