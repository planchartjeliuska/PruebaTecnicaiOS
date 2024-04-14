//
//  Expandable.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import SwiftUI

struct Expandable<Content:View>: View {
    var title:String
    var imageName: String
    @ViewBuilder var content: () -> Content
    
    @State var isExpanded = false
    
    var body: some View {
        VStack{
            
            Button(
                action: {
                isExpanded.toggle()
                }
            ){
                HStack(alignment: .center){
                    Image(imageName)
                        .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 40)
                    Text(title).font(.title2)
                    Spacer()
                    if isExpanded{
                        Image(systemName: "arrow.up")
                    }else{
                        Image(systemName: "arrow.down")
                    }
                }.foregroundColor(.black)
                
            }.padding()
            
            if isExpanded{
                content()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.horizontal,65)
            }
        }
    }
}

#Preview {
    Expandable(title: "Dirección", imageName: "icn_location"
    ){
        Text("calle falsa")
    }
}
