//
//  InitSalaryInputView.swift
//  Timoney
//
//  Created by 권희철 on 9/24/24.
//

import SwiftUI

struct InitSalaryInputView: View {
    @Binding var salary: String
    @FocusState.Binding var isfocus: Bool
    @Binding var salaryModel: InitalizingDateModel
    
    var body: some View {
        VStack{
            //            HStack{
            //                Circle()
            //                    .frame(width: 20, height: 20)
            //                    .foregroundStyle(.accent)
            //                Circle()
            //                    .frame(width: 20, height: 20)
            //                    .foregroundStyle(.secondary)
            //                Circle()
            //                    .frame(width: 20, height: 20)
            //                    .foregroundStyle(.secondary)
            //            }
            //            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text("위에 입력한 기간동안의 ")
                    Text("급여를 알려 주세요.")
                }
                .fontWeight(.bold)
                .font(.title)
                Spacer()
            }
            .padding()
            
            TextField("원", text: $salaryModel.yourValue)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .font(.title2)
                .focused($isfocus)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        NavigationLink {
                            InitWishListView()
                        } label: {
                            Text("다음으로")  
                        }
                        .disabled(salaryModel.yourValue.isEmpty) // yourValue가 비어있으면 비활성화
                                            
                    }
                }
            //            Spacer()
            //            NavigationLink {
            //                InitDateInputView()
            //            } label: {
            //                ZStack{
            //                    RoundedRectangle(cornerRadius: 10)
            //                        .frame(width: 100, height: 50)
            //                    Text("다음으로")
            //                        .foregroundStyle(.white)
            //                }
            //            }
            //            .disabled(salary.isEmpty)
        }
        //.padding()
        
    }
}

//#Preview {
//    @Previewable @State var salary: String = ""
//    @Previewable @FocusState var isFocus: Bool
//    InitSalaryInputView(salary: $salary, isfocus: $isFocus)
//}
