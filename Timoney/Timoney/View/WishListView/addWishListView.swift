//
//  addWishListView.swift
//  Timoney
//
//  Created by 박준영 on 9/24/24.
//

import SwiftUI
import PhotosUI

struct addWishListView: View {
    @State var model = addWishList()
    
    var body: some View {
        NavigationStack {
            // Text("위시리스트 추가")
            
            ScrollView {
                
                
                TextFieldView(model: $model, title: "물품명")
                TextFieldView(model: $model, title: "금액")
                TextFieldView(model: $model, title: "이미지")
                // TextFieldView(title: "아이콘")
                
                HStack {
                    SelectButton(model: $model, title: "취소하기", color: .red)
                    SelectButton(model: $model, title: "생성하기", color: .blue)
                }
                .frame(alignment: .center)
                
            }
            
            .navigationTitle("위시리스트 추가")
        }
    }
}

struct TextFieldView: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @Binding var model : addWishList
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if title == "금액" {
                HStack {
                    Text(title)
                    Spacer()
                    Text(model.formattedValueItem)
                        .fontWeight(.bold)
                        .foregroundStyle(.accent)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            } else {
                Text(title)
            }
            
            HStack {
                TextField(text: title == "물품명" ? $model.nameField : title == "금액" ? $model.valueItem : $model.imageURL) {
                    switch title {
                    case "물품명" : Text("최소 2자 이상 넣어주세요.")
                    case "금액" : Text("원")
                    default : Text("https://")
                    }
                }
                // 삭제 버튼
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
                .keyboardType(title == "금액" ? .decimalPad : .default)
                .multilineTextAlignment(title == "금액" ? .trailing : .leading)
                .frame(height: 20)
                .padding()
                .border(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray, lineWidth: 2)
                )
                if title == "이미지" {
                    PhotosPicker(selection: $avatarItem,
                                 matching: .any(of: [.images, .not(.screenshots)])) {
                        Image(systemName: "photo.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                                 .onChange(of: avatarItem) {
                                     Task {
                                         if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                                             avatarImage = loaded
                                             model.imageURL = "\(loaded)"
                                         } else {
                                             print("Failed")
                                         }
                                     }
                                 }
                }
            }
            avatarImage?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 180, alignment: .center)
                .clipped()
                .padding()
        }
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    }
}




struct SelectButton: View {
    @Environment(\.dismiss) var dismiss
    @Binding var model : addWishList
    var title: String
    var color: Color
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Text(title)
                .font(.headline)
                .padding()
                .frame(width: 150)
                .background(title == "생성하기" && (model.nameField.isEmpty || model.valueItem.isEmpty || model.imageURL.isEmpty) ? .gray : color)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(title == "생성하기" && (model.nameField.isEmpty || model.valueItem.isEmpty || model.imageURL.isEmpty) ? .gray : color, lineWidth: 2)
                )
        })
        .disabled(title == "생성하기" && (model.nameField.isEmpty || model.valueItem.isEmpty || model.imageURL.isEmpty))
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

#Preview {
    addWishListView()
}
