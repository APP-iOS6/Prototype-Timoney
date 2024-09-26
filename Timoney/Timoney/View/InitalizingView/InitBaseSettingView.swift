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
    @State private var isKeyboardVisible: Bool = false // 키보드 표시 상태 추적
    @State var Model = InitalizingDateModel()
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    InitDateInputView(DateModel: $Model)
                    Spacer()
                    InitSalaryInputView(salary: $salary, isfocus: $isFocus, salaryModel: $Model)
                    Spacer()
                    
                    if !Model.formattedYourValue.isEmpty {
                        Text("\(Model.timeInterval)일 동안")
                            .font(.title3)
                        
                        Text("\(Model.formattedYourValue) 법니다.")
                            .fontWeight(.bold)
                            .font(.title2)
                        
                        Text("")
                    }
                    
                    if !isKeyboardVisible {
                        NavigationLink {
                            InitWishListView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 50)
                                Text("다음으로")
                                    .foregroundStyle(.white)
                            }
                        }
                        .disabled(Model.yourValue.isEmpty) // yourValue가 비어있으면 비활성화
                    }
                    
                }
                .padding()
                .navigationBarBackButtonHidden()
                .toolbarBackground(.white, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.secondary)
                            Circle()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.accent)
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .scrollDisabled(!isKeyboardVisible) // 키보드가 있을 때만 스크롤 가능
        }
        .onTapGesture {
            isFocus = false // 키보드를 내리기
        }
        .onAppear {
            // 키보드 이벤트 감지
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                withAnimation {
                    isKeyboardVisible = true
                }
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                withAnimation {
                    isKeyboardVisible = false
                }
            }
        }
        .onDisappear {
            // 뷰가 사라질 때 옵저버 제거
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: isFocus ? 150 : 0) // 대략적인 키보드 높이 설정
        }
    }
}

#Preview {
    NavigationStack{
        InitBaseSettingView()
    }
}
