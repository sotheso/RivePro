//
//  SignInView.swift
//  RivePro
//
//  Created by Sothesom on 19/10/1403.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State var isLoading = false
    @Binding var showSignIn: Bool
    
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")

    
    func logIn() {
        isLoading = true
        
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                confetti.triggerInput("Trigger explosion")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    showSignIn = false
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }

    
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
                SecureField("", text: $password)
                    .customTextField(image: Image("Icon Lock"))
            }
            
            Button {
                logIn()
            } label : {
                Label("ساخت حساب", systemImage: "arrow.right")
                    .customFont(.headline)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F77D8E"))
                    .foregroundStyle(.white)
                    .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(8, corners: [.topLeft])
                    .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
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
        .padding()
        .overlay(
            ZStack{
                if isLoading {
                    check.view()
                        .frame(width: 100, height: 100)
                    // موثع لود شدن جلو دسترسی به صفحه رو میگیره
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3 )
                    .allowsHitTesting(false )
            }
        )
    }
}

#Preview {
    SignInView(showSignIn: .constant(true))
}
