//
//  InventoryView.swift
//  Timoney
//
//  Created by 김수민 on 9/24/24.
//

import SwiftUI

struct InventoryView: View {
    @State var isSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination : addWishListView()) {
                            Image(systemName: "plus")
                                .font(.system(size: 24))
                        }
                        
                        NavigationLink(destination : EditView()) {
                            Image(systemName: "pencil")
                                .font(.system(size: 24))
                                .padding(.trailing,20)
                        }
                    }
                    
                    Grid(horizontalSpacing: -15, verticalSpacing: 15) {
                        GridRow {
                            ItemUIView2(icon: "3dicons", price: "20,000원", name: "미술용품", progress:"10")
                            ItemUIView(icon: "bag", price: "521,000원", name: "가방", progress:"Group 8")
                            ItemUIView(icon: "3dicons-2", price: "180,000원", name: "마이크", progress:"Group 7")
                        }
                        
                        GridRow {
                            ItemUIView(icon: "watch", price: "221,000원", name: "애플워치", progress:"Group 7")
                            ItemUIView2(icon: "3dicons-4", price: "38,000원", name: "쇼핑", progress:"10")
                            ItemUIView2(icon: "3dicons-5", price: "18,000원", name: "책", progress:"10")
                        }
                        
                        GridRow {
                            ItemUIView2(icon: "3dicons-6", price: "4,500원", name: "커피", progress:"10")
                            ItemUIView2(icon: "3dicons-7", price: "21,000원", name: "우산", progress:"10")
                            ItemUIView(icon: "wallet", price: "490,000원", name: "메종마르지엘라 지갑",progress:"Group 8")
                        }
                        
                        GridRow {
                            ItemUIView2(icon: "3dicons", price: "20,000원", name: "미술용품", progress:"10")
                        }
                    }
                    .padding(.top, 20)
                    
//                    // 수정하기 버튼
//                    Button(action: {
//                        isSheetShowing.toggle()
//                    }, label: {
//                        Text("수정하기")
//                            .frame(width: 100, height: 40)
//                            .background(Color(red: 3/255, green: 78/255, blue: 43/255))
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
//                    })
//                    .sheet(isPresented: $isSheetShowing, content: {
//                        EditView()
//                    })
//                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("위시리스트")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ItemUIView: View {
    var icon: String
    var price: String
    var name: String
    var progress: String
    
    var body: some View {
        VStack {
            // 아이콘
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
            
            
            // 물건 이름
            Text(name)
                .font(.caption2)
                .fontWeight(.light)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            // 물건 가격
            Text(price)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // 게이지바
            Image(progress)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110)
        }
        .padding()
    }
}

struct ItemUIView2: View {
    var icon: String
    var price: String
    var name: String
    var progress: String
    
    var body: some View {
        VStack {
            // 아이콘
            ZStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                
                // 구매하기 버튼
                Button(action: {
                }) {
                    Text("구매하기")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.gray)
                        .cornerRadius(5)
                }
            }
            
            // 물건 이름
            Text(name)
                .font(.caption2)
                .fontWeight(.light)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            // 물건 가격
            Text(price)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // 게이지바
            Image(progress)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110)
        }
        .padding()
    }
}

#Preview {
    InventoryView()
}
