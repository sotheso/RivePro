//
//  SwiftUIView.swift
//  RivePro
//
//  Created by Sothesom on 19/10/1403.
//

import SwiftUI
import RiveRuntime

struct SwiftUIView: View {
    var body: some View {
        HStack{
            RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivty", artboardName: "CHAT").view()
        }
        .background(Color("Background 2"))
    }
}

#Preview {
    SwiftUIView()
}
