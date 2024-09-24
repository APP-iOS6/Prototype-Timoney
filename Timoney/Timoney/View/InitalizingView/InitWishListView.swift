//
//  InitWishListView.swift
//  Timoney
//
//  Created by 권희철 on 9/24/24.
//

import SwiftUI

struct InitWishListView: View {
    
    @Environment(\.dismiss) var dissmiss
    
    @State var wishProduct: String = ""
    @State var productName: String = ""
    @State var price: String = ""
    @State var isDisplayWish: Bool = false
    @State var howMany: Int = 1
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.accent)
            }
            Spacer()
            VStack(alignment: .leading){
                Text("번 금액으로")
                Text("사고 싶은 물건이 있나요?")
            }
            .font(.largeTitle)
            if isDisplayWish{
                VStack(alignment: .leading, spacing: 5){
                    Text("물품명")
                    TextField("이름", text: $productName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    Text("가격")
                    TextField("금액", text: $price)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    Text("개수")
                    HStack{
                        Spacer()
                        Picker("개수", selection: $howMany){
                            ForEach(1...10, id: \.self){i in
                                Text("\(i)개")
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 0.5)
                        .foregroundStyle(.quaternary))
                }
                .padding()
            }else{
                HStack{
                    TextField("검색", text: $wishProduct)
                        .padding()
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal)
                }
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.secondary))
                .padding()
            }
            Spacer()
            Toggle(isOn: $isDisplayWish) {}
                .labelsHidden()
            Button{
            }label: {
                HStack{
                    Text("건너뛰기")
                    Image(systemName: "arrowtriangle.right.fill")
                }
            }
            Button{
                
            }label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 50)
                    Text("완료")
                        .colorInvert()
                }
            }
            .padding()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button{
                    dissmiss()
                }label: {
                    Text("이전으로")
                }
            }
        }
    }
}

#Preview {
    InitWishListView()
}
