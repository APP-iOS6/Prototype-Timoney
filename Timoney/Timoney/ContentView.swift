//
//  ContentView.swift
//  Timoney
//
//  Created by 박준영 on 9/24/24.
//

import SwiftUI

struct ContentView: View {   
    @AppStorage("firstLaunch") var isFirstLaunch: Bool = false
    var body: some View {
        if isFirstLaunch {
            MainView()
            //MainView2()
        } else {
            InitalizingView()
        }
    }
}

#Preview {
    ContentView()
}
