//
//  InitDateInputView.swift
//  Timoney
//
//  Created by 권희철 on 9/24/24.
//

import SwiftUI

struct InitDateInputView: View {
    @Environment(\.dismiss) var dissmiss
    @Binding var DateModel: InitalizingDateModel
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("시작 날짜와")
                    Text("마감 날짜를 선택해주세요.")
                }
                .font(.title)
                .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            VStack{
                HStack{
                    DatePicker("시작 날짜 :", selection: $DateModel.startDate, displayedComponents: .date)
                        .padding()
                        .onTapGesture(count: 99) {}
                          .onTapGesture {
                                  UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                           }
                }
                .frame(width: 300, alignment: .center)
                HStack{
                    DatePicker("마감 날짜 :", selection: $DateModel.endDate, displayedComponents: .date)
                        .padding()
                        .onTapGesture(count: 99) {}
                          .onTapGesture {
                                  UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                           }
                }
                .frame(width: 300, alignment: .center)
                Divider()
//                Text("\(DateModel.timeInterval)일 간격으로 계산됩니다")
//                    .padding()
            }
            
//            Spacer()
//            NavigationLink {
//                InitWishListView()
//            } label: {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 100, height: 50)
//                    Text("다음으로")
//                        .foregroundStyle(.white)
//                }
//            }
//        }
//        .padding()
//        .navigationBarBackButtonHidden()
//        .toolbar {
//            ToolbarItem(placement: .cancellationAction) {
//                Button{
//                    dissmiss()
//                }label: {
//                    Text("이전으로")
//                }
//            }
        }
    }
}

//#Preview {
//    NavigationStack{
//        InitDateInputView()
//    }
//}
