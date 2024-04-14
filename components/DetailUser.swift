//
//  DetailUser.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import SwiftUI
import MapKit

struct DetailUser: View {
    var user: ResponseUser
    
    
    var body: some View {
        VStack{
            VStack(alignment: .center){
                Image("usuario")
                    .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                    .frame(width: 100.0,height: 100)
                Text(user.username)
                Text(user.email)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding()
            .background(Gradient(colors: [Color("gradient1"),
                                          Color ("gradient2")]))
            
            ScrollView{
                
                HStack(alignment: .center){
                    Image("icn_name")
                        .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 40)
                    Text(user.name).font(.title2)
                    Spacer()
                }.padding()
                
                Expandable(title: "Address",
                           imageName: "icn_location"){
                    Text("Street: " + user.address.street)
                    Text(user.address.suite)
                    Text("City: " + user.address.city)
                    Text("Zip Code: " + user.address.zipcode)
                    MapView(coordinate: CLLocationCoordinate2D(
                        latitude: Double(user.address.geo.lat) ?? 0.0,
                         longitude: Double(user.address.geo.lng) ?? 0.0)
                    ).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 300, maxHeight: 300)
                    
                }
                
                HStack(alignment: .center){
                    Image("icn_phone")
                        .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 40)
                    Text(user.phone).font(.title2)
                    Spacer()
                }.padding()
                
                HStack(alignment: .center){
                    Image("icn_web")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 40, height: 40)
                    Text(user.website).font(.title2)
                    Spacer()
                }.padding()
                
                Expandable(title: user.company.name,
                           imageName: "icn_company"){
                    Text("Phrase: " + user.company.catchPhrase)
                    Text("Bs: " + user.company.bs)
                    
                }
                
            }
        }
    }
}

#Preview {
    DetailUser(
        user: ResponseUser(
            id: 1,
            name: "Jeliuska",
            username: "jeli",
            email: "jeliuska06@gmail.com",
            address: Address(
                street: "Calle 1a", suite: "apto 401", city: "San gil", zipcode: "883293",
                geo: Geo(lat: "6.5542757", lng: "-73.1264375")),
            phone: "311 536 0808",
            website: "www.google.com",
            company: Company(name: "Grovi", catchPhrase: "Programar", bs: "aplicaciones"))
    )
}
