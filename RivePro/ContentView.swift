//
//  ContentView.swift
//  RivePro
//
//  Created by Sothesom on 21/10/1403.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    @State var isOpen = false
    let button = RiveViewModel(fileName: "menu_button",stateMachineName: "State Machine", autoPlay: false)
    
    
    var body: some View {
        ZStack {
// ناحیه امن برای همه نما ها
            Group{
                switch selectedTab {
                case .chat:
                    HomeView()
                case .user:
                    Text("user")
                case .search:
                    Text("search")
                case .timer:
                    Text("timer")
                case .bell:
                    Text("bell")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 120)
            }
            .ignoresSafeArea()
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x:0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }
            
            TabBar()
        }
    }
}

#Preview {
    ContentView()
}
