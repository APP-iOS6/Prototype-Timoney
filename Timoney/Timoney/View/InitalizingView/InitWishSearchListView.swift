//
//  InitWishSearchListView.swift
//  Timoney
//
//  Created by 권희철 on 9/25/24.
//

import SwiftUI

struct InitWishSearchListView: View {
    @Binding var search:String
    @Binding var isSeleted: Bool
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                if !search.isEmpty && !isSeleted{
                    ScrollView(.vertical){
                        VStack{
                            Image(.cornchip)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image(.macbookpro)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image(.iphone16Pro)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image(.galaxyfold)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.onTapGesture{
                            isSeleted.toggle()
                        }
                    }
                }
            }.frame(width: proxy.size.width * 0.8)
                .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .local).midY)
        }
    }
}

#Preview {
    @Previewable @State var search: String = "1"
    @Previewable @State var isSelected: Bool = false
    InitWishSearchListView(search: $search, isSeleted: $isSelected)
}
