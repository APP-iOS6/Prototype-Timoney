//
//  InitWishSearchListView.swift
//  Timoney
//
//  Created by 권희철 on 9/25/24.
//

import SwiftUI

struct InitWishSearchListView: View {
    @Binding var search:String
    @Binding var isSelected: Bool
    var body: some View {
        VStack{
            if !search.isEmpty && !isSelected{
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
                        search = "콘칩"
                        isSelected.toggle()
                    }
                }
            }
        }.padding(.horizontal, 20)
    }
}

#Preview {
    @Previewable @State var search: String = "1"
    @Previewable @State var isSelected: Bool = false
    InitWishSearchListView(search: $search, isSelected: $isSelected)
}
