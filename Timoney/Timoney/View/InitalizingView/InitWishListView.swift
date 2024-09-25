//
//  InitWishListView.swift
//  Timoney
//
//  Created by 권희철 on 9/24/24.
//

import SwiftUI

struct InitWishListView: View {
    
    @Environment(\.dismiss) var dissmiss
    
    @State private var wishProduct: String = ""
    @State private var isSelected: Bool = false
    
    @State private var productName: String = ""
    @State private var price: String = ""
    @State private var isDisplayWish: Bool = false
    @State private var howMany: Int = 1
    
    @AppStorage("firstLaunch") var firstLunch: Bool!
    
    @FocusState private var isFocus: Bool
    
    
    var isDoneButtonAbled: Bool{
        if isDisplayWish{
            return (productName.isEmpty || price.isEmpty) ? true : false
        }else{
            return wishProduct.isEmpty
        }
    }
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                VStack{
                    Spacer()
                    VStack(alignment: .leading){
                        Text("번 금액으로")
                        Text("사고 싶은 물건이 있나요?")
                    }
                    .font(.title)
                    if isDisplayWish{
                        VStack(alignment: .leading, spacing: 5){
                            Text("물품명")
                            TextField("이름", text: $productName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom)
                                .keyboardType(.alphabet)
                                .autocorrectionDisabled(true)
                                .focused($isFocus)
                            
                            Text("가격")
                            TextField("금액", text: $price)
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                                .padding(.bottom)
                                .focused($isFocus)
                                .onSubmit {
                                    print("dddd")
                                }
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
                                .onChange(of: wishProduct) {
                                    isSelected = false
                                }
                            Image(systemName: "magnifyingglass")
                                .padding(.horizontal)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.secondary))
                        .padding()
                        InitWishSearchListView(search: $wishProduct, isSeleted: $isSelected)
                    }
                    
                    HStack{
                        if isDisplayWish{
                            Text("검색 해서 찾기")
                        }else{
                            Text("직접 작성하기")
                        }
                        
                        Toggle(isOn: $isDisplayWish) {}
                            .labelsHidden()
                    }
                    
                    Spacer()
                    
                    Button{
                        firstLunch = true
                    }label: {
                        HStack{
                            Text("건너뛰기")
                            Image(systemName: "arrowtriangle.right.fill")
                        }
                    }
                    
                    Button{
                        isFocus = false
                        firstLunch = true
                    }label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 50)
                            Text("완료")
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                    .disabled(isDoneButtonAbled)
                }
                .padding()
                .navigationBarBackButtonHidden()
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button{
                            dissmiss()
                        }label: {
                            Text("이전으로")
                        }
                    }
                    ToolbarItem(placement: .principal) {
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
                    }
                }
            }
            .scrollDisabled(!isFocus)
            .scrollIndicators(.hidden)
        }.onTapGesture {
            print("tab")
            isFocus = false
        }
    }
}

#Preview {
    InitWishListView()
}
