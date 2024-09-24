//
//  InitSalaryInputView.swift
//  Timoney
//
//  Created by 권희철 on 9/24/24.
//

import SwiftUI

struct InitSalaryInputView: View {
    
    @State var salary: String = ""
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.accent)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text("당신의 버는")
                    Text("금액을 말씀해 주세요.")
                }
                .font(.largeTitle)
                Spacer()
            }
            .padding()
            
            TextField("원", text: $salary)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
            
            Spacer()
            NavigationLink {
                InitDateInputView()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 50)
                    Text("다음으로")
                        .colorInvert()
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    InitSalaryInputView()
}
