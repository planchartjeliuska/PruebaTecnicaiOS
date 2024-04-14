//
//  itemUsers.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import SwiftUI

struct itemUsers: View {
    
    var user: ResponseUser
    
    var body: some View {
        VStack(alignment: .leading){
            Text(user.name).bold().font(.system(size: 20))
            Text(user.email).font(.system(size: 17))
            Text(user.website).font(.system(size: 17))
        }
    }
}

#Preview {
    itemUsers(
        user: ResponseUser(
            id: 1,
            name: "Jeliuska",
            username: "jeli",
            email: "jeliuska06@gmail.com",
            address: Address(
                street: "Calle 1a", suite: "apto 401", city: "San gil", zipcode: "883293",
                geo: Geo(lat: "37.7749", lng: "-122.4194")),
            phone: "311 536 0808",
            website: "www.google.com",
            company: Company(name: "Grovi", catchPhrase: "Programar", bs: "aplicaciones"))
    )
}
