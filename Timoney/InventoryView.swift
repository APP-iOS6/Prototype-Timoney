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
            VStack {
                Text("위시리스트")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .foregroundColor(.black)
                
                ScrollView {
                    Grid(horizontalSpacing: -15, verticalSpacing: 15) {
                        GridRow {
                            ItemView(icon: "3dicons", price: "20,000원", name: "미술용품", progress:"Rectangle 106")
                            ItemView(icon: "3dicons-1", price: "521,000원", name: "가방", progress:"Group 8")
                            ItemView(icon: "3dicons-2", price: "180,000원", name: "마이크", progress:"Group 7")
                        }
                        
                        GridRow {
                            ItemView(icon: "3dicons-3", price: "221,000원", name: "헤드셋", progress:"Group 7")
                            ItemView(icon: "3dicons-4", price: "38,000원", name: "쇼핑", progress:"Rectangle 106")
                            ItemView(icon: "3dicons-5", price: "18,000원", name: "책", progress:"Rectangle 106")
                        }
                        
                        GridRow {
                            ItemView(icon: "3dicons-6", price: "4,500원", name: "커피", progress:"Rectangle 106")
                            ItemView(icon: "3dicons-7", price: "21,000원", name: "우산", progress:"Rectangle 106")
                            ItemView(icon: "3dicons-8", price: "490,000원", name: "지갑",progress:"Group 8")
                        }
                        
                        GridRow {
                            ItemView(icon: "3dicons", price: "20,000원", name: "미술용품", progress:"Rectangle 106")
                            ItemView(icon: "3dicons-1", price: "521,000원", name: "가방", progress:"Group 8")
                            ItemView(icon: "3dicons-2", price: "180,000원", name: "마이크", progress:"Group 7")
                        }
                        
                        GridRow {
                            ItemView(icon: "3dicons-3", price: "221,000원", name: "헤드셋", progress:"Group 7")
                            ItemView(icon: "3dicons-4", price: "38,000원", name: "쇼핑", progress:"Rectangle 106")
                            ItemView(icon: "3dicons-5", price: "18,000원", name: "책", progress:"Rectangle 106")
                        }
                    }
                }
                
                
                // 수정하기 버튼
                Button(action: {
                    isSheetShowing.toggle()
                }, label: {
                    Text("수정하기")
                        .frame(width: 100, height: 40)
                        .background(Color(red: 3/255, green: 78/255, blue: 43/255))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                })
                .sheet(isPresented: $isSheetShowing, content: {
                    EditView()
                })
                .padding(.bottom, 20)
                
            }
        }
        // .navigationBarBackButtonHidden(true)
    }
    
struct ItemView: View {
    var icon: String
    var price: String
    var name: String
    var progress: String
        
    var body: some View {
            VStack {
                
                //아이콘
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                
                //물건 이름
                Text(name)
                    .font(.caption2)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                //물건 가격
                Text(price)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                //게이지바
                Image(progress)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110)
            }
            .padding()
        }
    }
}

#Preview {
    InventoryView()
}
