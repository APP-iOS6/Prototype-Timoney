//
//  InitBaseSettingView.swift
//  Timoney
//
//  Created by 권희철 on 9/25/24.
//

import SwiftUI

struct InitBaseSettingView: View {
    @Environment(\.dismiss) var dismiss
    @State var salary: String = ""
    @FocusState var isFocus: Bool
    
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                VStack{
                    
                    InitDateInputView()
                    Spacer()
                    InitSalaryInputView(salary: $salary, isfocus: $isFocus)
                    
                    Spacer()
                    NavigationLink {
                        InitWishListView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 50)
                            Text("다음으로")
                                .foregroundStyle(.white)
                        }
                    }
                    .disabled(salary.isEmpty)
                }
                .padding()
                .navigationBarBackButtonHidden()
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button{
                            dismiss()
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
                            
                                .foregroundStyle(.accent)
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding()
            }.onTapGesture{
                isFocus = false
            }
            .scrollDisabled(!isFocus)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    NavigationStack{
        InitBaseSettingView()
    }
}
