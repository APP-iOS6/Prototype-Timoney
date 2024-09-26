//
//  InitExplaneView.swift
//  Timoney
//
//  Created by 권희철 on 9/25/24.
//

import SwiftUI
import Lottie

struct InitExplaneView: View {
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.accent)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
            }
            LottieView(animation: .named("main")).playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
                .padding(.horizontal, 50)
            
//            Text("")
//            
//            Text("당신의 꿈, Timoney가 함께합니다.")
//                .font(.headline)
//                .fontDesign(.rounded)
//                .multilineTextAlignment(.center)
            
            Text("")
            
            Text("열심히 달려온 당신, 지금까지 모은 자산이 얼마인지 궁금하지않나요?")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            
            Text("")
            
            Text("원하는 물건을 언제쯤 손에 넣을 수 있을지 알고 싶으신가요?")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            
            Text("")
            
            Text("Timoney는 목표 달성을 위해 조용히 일하며 필요한 정보를 언제든 알려드립니다.")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            
            Text("\n")
            
            Text("이제 당신의 꿈을 Timoney와 함께 실현해보세요.")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            NavigationLink {
                InitBaseSettingView()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 50)
                    Text("시작하기")
                        .foregroundStyle(.white)
                }
            }
            // .navigationBarBackButtonHidden()
        }.padding()
    }
}

#Preview {
    NavigationStack{
        InitExplaneView()
    }
}
