//
//  ItemView.swift
//  Timoney
//
//  Created by 강승우 on 9/24/24.
//

import SwiftUI

struct ItemView: View {
    
    var item: WishItem
    var money: Double
    var pay: Double
    var progressPercent: Int {
        if money >= item.price {
            return 100
        } else {
            return Int(money/item.price * 100)
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Text(item.name) // 필요 없을거 같기도
                Image(item.imgName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("\(Int(item.price))원")
                    .font(.largeTitle)
                
                Text("\(progressPercent)%")
                    .offset(x: proxy.size.width * 0.01 * CGFloat((Double(progressPercent) * 0.9 - 45)))
                    .font(.system(size: 14))
                    .padding(.horizontal)
                    .padding(.bottom,0)
                ProgressView(value: money > item.price ? item.price : money, total: item.price)
                    .padding()
                    .padding(.top,-15)
                if money < item.price {
                    Text("\(item.name) 구매 가능까지 \(getLeftTime())남았습니다.")
                } else {
                    Text("\(item.name)을(를) \(Int(money/item.price))개 구매할 수 있습니다.")
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
