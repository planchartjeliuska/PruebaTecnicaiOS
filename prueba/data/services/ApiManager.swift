//
//  ApiManager.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import Foundation
import Alamofire

class ApiManager {
    
    public static let shared = ApiManager()
    
    func callApi(
        pathURL:String,
        onComplete : @escaping((AFDataResponse<Any>) -> Void),
        onError: @escaping((String) -> Void)
    ){
        
        guard let url = URLComponents(
            string: "\(Constants.BASE_URL)\(pathURL)"
        ) else {
            return
        }
        
        
        AF.request(
            url,
            method: .get,
            encoding: JSONEncoding.default
        ).responseJSON{
            response in
            
            switch response.result{
            case .success: onComplete(response)
            case .failure: onError("Ha ocurrido un Error")
            }
        }
        
    }
}
