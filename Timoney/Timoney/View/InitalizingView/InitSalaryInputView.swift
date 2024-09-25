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
                    Text("당신의 버는")
                    Text("금액을 말씀해 주세요.")
                }
                .font(.title)
                Spacer()
            }
            .padding()
            
            TextField("원", text: $salary)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .font(.title2)
                .focused($isfocus)
            
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
        .padding()
        
    }
}

#Preview {
    @Previewable @State var salary: String = ""
    @Previewable @FocusState var isFocus: Bool
    InitSalaryInputView(salary: $salary, isfocus: $isFocus)
}
