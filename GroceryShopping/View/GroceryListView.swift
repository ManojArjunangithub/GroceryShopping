//
//  ContentView.swift
//  GroceryShopping
//
//  Created by Manoj Kumar Arjunan on 25/02/24.
//

import SwiftUI

struct GroceryListView: View {
    @State var showShop = false
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 50){
                    Image("avocado")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Text("We deliver\n grocery at your doorstep.")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                    
                    Text("Grocery gives you fresh vegetables and fruits,\n Order fresh at grocery")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                    Spacer()
                    Button(action: {
                        showShop = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                Text("Get started")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .bold()
                        }
                    }
                    ).frame(width: 200, height: 70)
                        .foregroundStyle(.purple)
                }
            }.padding()
            .navigationDestination(isPresented: $showShop) {
                ShopView()
            }
        }
    }
}

#Preview {
    GroceryListView()
}
