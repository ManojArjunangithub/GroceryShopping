//
//  ShopView.swift
//  GroceryShopping
//
//  Created by Manoj Kumar Arjunan on 25/02/24.
//

import SwiftUI

struct ShopView: View {
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var items: [[Any]] = shopItems
    @State var goToCart = false
    
    var body: some View {
        VStack(spacing: 5){
            VStack{
                Text("Good Morning")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(.gray)
                Text("Let's order Fresh \nitems for you ")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                Spacer().frame(height: 75)
                Text("Fresh Items")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(.gray)
            }.padding(20)
            ScrollView{
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(0..<items.count, id:\.self) { item in
                        ShopItem(imageName: items[item][0] as? String ?? "", title: items[item][1] as? String ?? "", price: items[item][2] as? Double ?? 0.0, color: items[item][3] as! Color, selfIndex: item)
                    }
                }
            }.padding(15)
        }
        .navigationDestination(isPresented: $goToCart, destination: {
            CartView()
        })
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    goToCart = true
                }, label: {
                    Image(systemName: "cart")
                })
            }
        }
    }
}

#Preview {
    ShopView()
}
