//
//  ApiService.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import Foundation
import Alamofire

struct ApiService{
    public static let shared = ApiService()
    
    
    func getUsers(
        onComplete : @escaping (ResponseUsers) -> Void,
        onError: @escaping((String) -> Void)
    ){
        ApiManager.shared.callApi(
            pathURL: Constants.PATH_USERS,
            onComplete: { response in
                
                do{
                    if let data = response.data {
                        let decodedResponse = try JSONDecoder().decode( ResponseUsers.self, from: data)
                        onComplete(decodedResponse)
                    }
                }catch{
                    onError ("No se puede leer la respuesta")
                }
                
            },
            onError: onError
        )
    }
}


