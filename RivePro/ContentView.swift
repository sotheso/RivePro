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
// نمای پشت برای Side Menu
            Color("Background 2").ignoresSafeArea()
            
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
// حالت افکت طور چرخشی
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
            
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
// ماسک صفجه Content View
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
// فکت چرخش به سمت SideMenu
            .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z:0))
            .offset(x: isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .ignoresSafeArea()
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x:0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
// زمان واکنش با انیمیشن
// حالت جامپی
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
            
            TabBar()
                .offset(y: isOpen ? 300 : 0)
            
        }
    }
}

#Preview {
    ContentView()
}
