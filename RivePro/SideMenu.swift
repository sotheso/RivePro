//
//  SideMenu.swift
//  RivePro
//
//  Created by Sothesom on 24/10/1403.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2){
                    Text("Sothesom")
                        .customFont(.body)
                    
                    Text("iOS Developer")
                        .customFont(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .customFont(.subheadline)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems) { item in
                    
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.2)
                        .padding(.horizontal)
                    
                    HStack(spacing: 14){
                        item.icon.view()
                            .frame(width: 32, height: 32)
                            .opacity(0.6)
                        Text(item.text)
                            .customFont(.headline)
                            .offset(x: -7 ,y: 3)
                    }
                    .onTapGesture {
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                            item.icon.setInput("active", value: false)
                        }
                        
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(12)
                }
                
            }
            Spacer()
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SideMenu()
}


//-----------------------------------------------------
// برای لیست ایکون های محرک

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
}


var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH")),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR")),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"))
]
