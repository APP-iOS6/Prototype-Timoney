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
    
    var pay: Double = 60000 // 월급
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination : addWishListView()) {
                            Image(systemName: "plus.app")
                                .font(.system(size: 24))
                                .padding(.leading, 15)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.system(size: 24))
                                .padding(5)
                                .padding(.trailing, 15)
                        }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.05)
                    
                    //날짜
                    Text("24.09.20 ~ 24.09.24")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .padding(.top, 30)
                        .padding(.bottom, 5)
                    
                    //금액
                    Text("현재까지 모인 금액")
                    Text("\(Int(money))원")
                        .contentTransition(.numericText())
                        .transaction { t in
                            t.animation = .default
                        }
                        .font(.system(size: 32, weight:.bold))
                        .padding(.bottom, 30)
                    
                    TabView {
                        ForEach(items) { item in
                            ItemView(item: item, money: money, pay: pay)
                            
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.55)
                
                    NavigationLink(destination: InventoryView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.accent)
                                .opacity(0.8)
                            HStack {
                                Image(systemName: "list.bullet.clipboard")
                                Text("위시리스트")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .padding()
                        }
                        .frame(width: proxy.size.width * 0.95, height: proxy.size.height * 0.08)
                        .padding(.top,30)
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
}


struct WishItem : Identifiable{
    var id: UUID = UUID()
    var name: String
    var imgName: String
    var price: Double
    
    //    init(name: String, imgName: String, price: Double) {
    //        self.name = name
    //        self.imgName = imgName
    //        self.price = price
    //    }
}

#Preview {
    MainView2()
}
