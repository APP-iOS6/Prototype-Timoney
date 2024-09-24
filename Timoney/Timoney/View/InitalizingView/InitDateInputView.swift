//
//  InitDateInputView.swift
//  Timoney
//
//  Created by 권희철 on 9/24/24.
//

import SwiftUI

struct InitDateInputView: View {
    
    @Environment(\.dismiss) var dissmiss
    
    @State var startDate: Date = .now
    @State var endDate: Date = (Calendar.current.date(byAdding: .month, value: 1, to: .now) ?? .now)
    
    var timeInterval: Int{
        Int(endDate.timeIntervalSince(startDate)) / 60 / 60 / 24
    }
    
    var body: some View {
        VStack{
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
            
            Spacer()
            
            HStack{
                VStack(alignment: .leading){
                    Text("시작 날짜와")
                    Text("마감 날짜를 선택해주세요.")
                }
                .font(.largeTitle)
                Spacer()
            }
            .padding()
            
            VStack{
                HStack{
                    DatePicker("시작", selection: $startDate, displayedComponents: .date)
                        .padding()
                }
                HStack{
                    DatePicker("마감", selection: $endDate, displayedComponents: .date)
                        .padding()
                }
                Divider()
                Text("\(timeInterval)일 간격으로 계산됩니다")
            }
            
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
    NavigationStack{
        InitDateInputView()
    }
}
