//
//  ItemView.swift
//  Timoney
//
//  Created by 강승우 on 9/24/24.
//

import SwiftUI

enum AnimationPhase : CaseIterable {
    case red, orange, yellow, green, blue, indigo, purple
}

struct ItemView: View {
    var item: WishItem
    var money: Double
    var pay: Double
    @State private var selected: Bool = false
    @State private var timer: Timer? // 타이머를 저장할 변수
    var progressPercent: Int {
        if money >= item.price {
            return 100
        } else {
            return Int(money/item.price * 100)
        }
    }
    
    var imageName: String {
        if progressPercent == 100 {
            return "money_4"
        } else if progressPercent >= 90 {
            return "money_3"
        } else if progressPercent >= 50 {
            return "money_2"
        } else {
            return "money_1"
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    Image(item.imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(selected ? 0.9 : 1.2) // 상태에 따라 스케일 변경
                        .onAppear {
                            // 뷰가 나타날 때 타이머 시작
                            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                                if selected == true {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        selected.toggle() // 상태를 토글
                                    }
                                }
                            }
                        }
                        .onDisappear {
                            // 뷰가 사라질 때 타이머 중지
                            timer?.invalidate()
                        }
                        .padding()
                    
                    Text(item.name) // 필요 없을거 같기도
                        .font(.system(size: 14))
                    Text("\(Int(item.price))원")
                        .font(.system(size: 20))
                        .contentTransition(.numericText())
                    
                    
                    Text("\(progressPercent)%")
                        .offset(x: proxy.size.width * 0.01 * CGFloat((Double(progressPercent) * 0.9 - 45)))
                        .font(.system(size: 14))
                        .padding(.horizontal)
                        .padding(.bottom,0)
                    ProgressView(value: money > item.price ? item.price : money, total: item.price)
                        .scaleEffect(y:2.5)
                        .padding()
                        .padding(.top,-15)
                        .phaseAnimator(AnimationPhase.allCases) { view, phase in
                            if money < item.price {
                                
                                view.accentColor(.accent)
                            } else {
                                switch phase {
                                case .red :
                                    view.accentColor(.red)
                                    
                                case .orange :
                                    view.accentColor(.orange)
                                    
                                case .yellow :
                                    view.accentColor(.yellow)
                                    
                                case .green :
                                    view.accentColor(.green)
                                    
                                case .blue :
                                    view.accentColor(.blue)
                                    
                                case .indigo :
                                    view.accentColor(.indigo)
                                    
                                case .purple :
                                    view.accentColor(.purple)
                                }
                                
                            }
                        }
                        .accentColor(money < item.price ? .accent : .button)
                    
                    if money < item.price {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.clear)
                                .frame(width: proxy.size.width * 0.35, height: proxy.size.height * 0.1)
                            VStack {
                                Text("\(item.name) 구매 가능까지")
                                Text("\(getLeftTime())남았습니다.")
                                    .contentTransition(.numericText())
                                    .transaction { t in
                                        t.animation = .default
                                    }
                            }
                        }
                        
                    } else {
                        Link(destination: URL(string: "https://www.apple.com/kr/shop/buy-watch/apple-watch" )!) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.button)
                                    .frame(width: proxy.size.width * 0.35, height: proxy.size.height * 0.1)
                                HStack {
                                    Image(systemName: "bag.fill")
                                        .font(.system(size: 20))
                                    Text("구매하기")
                                        .font(.system(size: 20, weight: .bold))
                                }
                                .foregroundStyle(.white)
                                
                            }
                        }
                    }
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height * 0.8)
        }
    }
}

extension ItemView {
    func getLeftTime() -> String {
        var rst: String = ""
        
        var leftTime: Int = Int(ceil((item.price - money) / pay))
        if leftTime >= 1440 {
            rst += String(leftTime / 1440) + "일 "
            leftTime %= 1440
        }
        
        if leftTime >= 60 {
            rst += String(leftTime / 60) + "시간 "
            leftTime %= 60
        }
        
        if leftTime > 0 {
            rst += String(leftTime) + "분 "
        }
        
        return rst
    }
}

#Preview {
    ItemView(item: WishItem(name: "가방", imgName: "bag", price: 600000), money: 2600, pay: 35000)
}
