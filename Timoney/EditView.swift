//
//  EditView.swift
//  Timoney
//
//  Created by 김수민 on 9/24/24.
//

import SwiftUI

struct EditView: View {
    var body: some View {
        NavigationStack {
            Text("위시리스트 수정")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
                .foregroundColor(.black)
            
            ScrollView{
                VStack(spacing: 15) {
                    ItemListView(icon: "3dicons", price: "20,000원", name: "미술용품", progress: "Rectangle 106")
                    ItemListView(icon: "3dicons-1", price: "521,000원", name: "가방", progress: "Group 8")
                    ItemListView(icon: "3dicons-2", price: "180,000원", name: "마이크", progress: "Group 7")
                    ItemListView(icon: "3dicons-3", price: "221,000원", name: "헤드셋", progress: "Group 7")
                    ItemListView(icon: "3dicons-4", price: "38,000원", name: "쇼핑", progress: "Rectangle 106")
//                    ItemListView(icon: "3dicons-5", price: "18,000원", name: "책", progress: "Rectangle 106")
//                    ItemListView(icon: "3dicons-6", price: "4,500원", name: "커피", progress: "Rectangle 106")
//                    ItemListView(icon: "3dicons-7", price: "21,000원", name: "우산", progress: "Rectangle 106")
//                    ItemListView(icon: "3dicons-8", price: "490,000원", name: "지갑", progress: "Group 8")
                    
                    //33,38줄 주석 풀기
                    
                    NavigationLink(destination: addWishListView()) {
                        Text("+ 위시리스트 추가")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 3/255, green: 78/255, blue: 43/255))
                    }
                    .padding(20)
                    .padding(.trailing, 150)
                }
            }
            
            NavigationLink(destination: InventoryView()) {
                Text("저장하기")
                    .frame(width: 100, height: 40)
                    .background(Color(red: 3/255, green: 78/255, blue: 43/255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
            }
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
                    .foregroundColor(Color(red: 3/255, green: 78/255, blue: 43/255))
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
