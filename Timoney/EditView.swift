//
//  EditView.swift
//  Timoney
//
//  Created by 김수민 on 9/24/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 15) {
                    ItemListView(icon: "watch", price: "221,000원", name: "애플워치", progress:"Group 7")
                    ItemListView(icon: "3dicons-2", price: "180,000원", name: "마이크", progress: "Group 7")
                    ItemListView(icon: "3dicons-4", price: "38,000원", name: "쇼핑", progress: "Rectangle 106")
                    ItemListView(icon: "bag", price: "521,000원", name: "가방", progress:"Group 8")
                    
//                    NavigationLink(destination: addWishListView()) {
//                        Text("+ 위시리스트 추가")
//                            .font(.title2)
//                            .fontWeight(.light)
//                            .foregroundColor(Color(red: 3/255, green: 78/255, blue: 43/255))
//                    }
//                    .padding(20)
//                    .padding(.trailing, 150)
                }
                .padding(.top,20)
            }
            .navigationTitle("위시리스트 수정")
            .navigationBarTitleDisplayMode(.automatic)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("저장하기")
                    .frame(width: 100, height: 40)
                    .background(Color(red: 3/255, green: 78/255, blue: 43/255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
            })
            .padding(.bottom, 20)
        
            
        }
        
         .navigationBarBackButtonHidden(true)
    }
}

struct ItemListView: View {
    var icon: String
    var price: String
    var name: String
    var progress: String
    
    var body: some View {
        HStack {
            //아이콘
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            VStack{
                //물건 이름
                Text(name)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                //물건 가격
                Text(price)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding()
            
            // 버튼들 기능 구현 x
            
            //삭제 버튼
            Button(action: {
                
            }) {
                Image(systemName: "trash")
                    .foregroundColor(Color(red: 250/255, green: 112/255, blue: 112/255))
                    .padding(.leading, 30)
            }
            
            //위치 바꾸기 버튼
            Button(action: {
                
            }) {
                Image(systemName: "arrow.up.arrow.down")
                    .foregroundColor(Color(red: 3/255, green: 78/255, blue: 43/255))
                    .padding()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    EditView()
}
