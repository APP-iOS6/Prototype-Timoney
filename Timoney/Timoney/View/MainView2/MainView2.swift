//
//  MainView2.swift
//  Timoney
//
//  Created by 박준영 on 9/24/24.
//

import SwiftUI

struct MainView2: View {
    @State var money: Double = 0 // 현재 금액
    var items: [WishItem] = [
        WishItem(name: "가방", imgName: "bag", price: 25000000),
        WishItem(name: "지갑", imgName: "wallet", price: 730000),
        WishItem(name: "시계", imgName: "watch", price: 320000),
    ]
    
    var pay: Double = 4000 // 월급
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .padding()
                    }
                }
                .frame(width: .infinity, height: proxy.size.height * 0.05)
                
                //날짜
                Text("24.09.20 ~ 24.09.24")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding()
                
                //금액
                Text("현재까지 모인 금액")
                Text("\(Int(money))원")
                    .font(.largeTitle)
                
                TabView {
                    ForEach(items) { item in
                        ItemView(item: item, money: money, pay: pay)
                        
                    }
                }
                .tabViewStyle(.page)
                .frame(width: .infinity, height: proxy.size.height * 0.6)
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.accent)
                            .opacity(0.8)
                        HStack {
                            Image(systemName: "bag.fill")
                            Text("위시리스트")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .padding()
                    }
                    .frame(width: proxy.size.width * 0.95, height: proxy.size.height * 0.08)
                }
                Spacer()
            }
            .onReceive(timer) { _ in
                money += pay
            }
        }
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
}


struct WishItem : Identifiable{
    var id: UUID = UUID()
    var name: String
    var imgName: String
    var price: Double
    
    init(name: String, imgName: String, price: Double) {
        self.name = name
        self.imgName = imgName
        self.price = price
    }
}

#Preview {
    MainView2()
}
