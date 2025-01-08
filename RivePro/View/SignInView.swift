//
//  SignInView.swift
//  RivePro
//
//  Created by Sothesom on 19/10/1403.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    var body: some View {
        VStack{
            Text("ساخت حساب")
                .customFont(.largeTitle)
            Text("اگر قبلا حساب کاربری نساختین، میتونید الان به راحتی اقدام کنید")
                .customFont(.caption)
                .multilineTextAlignment(.trailing)
                .padding(.bottom)
            
            VStack(alignment: .leading){
                Text("ایمیل")
                    .customFont(.subheadline)
                    .foregroundStyle(.secondary)
                TextField("", text: $email)
                    .customTextField(image: Image("Icon Email"))
            }
            
            VStack(alignment: .leading){
                Text("رمز عبور")
                    .customFont(.subheadline)
                    .foregroundStyle(.secondary)
                SecureField("", text: $email)
                    .customTextField(image: Image("Icon Lock"))
            }
            
            //Divider()
            HStack {
                Rectangle()
                    .fill(.black.opacity(0.1))
                    .frame(height: 1)
                
                Text("OR").customFont(.subheadline2).foregroundStyle(.black.opacity(0.3))
                
                Rectangle()
                    .fill(.black.opacity(0.1))
                    .frame(height: 1)
            }
            
            Text("ورود با حساب جمیل یا اپل ایدی").customFont(.subheadline2)
            
            HStack{
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x:0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)

// برای ساختن استروک دور این برنر به صورتی که از پر رنگ به کم رنگ بره
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(.linearGradient(colors:[.white.opacity(0.8), .white.opacity(0.1)], startPoint: .top, endPoint: .bottom))
        )
    }
}

#Preview {
    SignInView()
}
