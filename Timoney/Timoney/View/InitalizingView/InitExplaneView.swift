//
//  InitExplaneView.swift
//  Timoney
//
//  Created by 권희철 on 9/25/24.
//

import SwiftUI

struct InitExplaneView: View {
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
            Image(.explainPage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
                .padding(.horizontal, 50)

            Text("지금 돈이 얼마나 모였는지 앱을 켤 때 마다 확인해 보아요!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            
            NavigationLink {
                InitBaseSettingView()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 50)
                    Text("시작하기")
                        .foregroundStyle(.white)
                }
            }
        }.padding()
    }
}

#Preview {
    NavigationStack{
        InitExplaneView()
    }
}
