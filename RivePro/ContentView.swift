//
//  ContentView.swift
//  RivePro
//
//  Created by Sothesom on 21/10/1403.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .chat:
                Text("chat")
            case .user:
                Text("user")
            case .search:
                Text("search")
            case .timer:
                Text("timer")
            case .bell:
                Text("bell")
            }
            
            TabBar()
        }
    }
}

#Preview {
    ContentView()
}
