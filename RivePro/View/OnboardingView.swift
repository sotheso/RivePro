//
//  OnboardingView.swift
//  RivePro
//
//  Created by Sothesom on 18/10/1403.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    
    @State private var showSignIn = false
    
    
    var body: some View {
        ZStack {
            backgrandBlur()
            
            Color("Shadow")
                .opacity(showSignIn ? 0.4 : 0)
                .ignoresSafeArea()
            
            content()
//                .offset(y: showSignIn ? 50 : 0)
            
            if showSignIn {
                SignInView()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showSignIn = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
                }
        }
    }
    
    func content() -> some View {
        VStack {
            Spacer()
            Text("خیلی خوش آمدید، لطفا حساب باز کنید")
                .customFont(.largeTitle)
                .frame(width: 260)
                .multilineTextAlignment(.trailing)
            
            Text("برای دنبال کردن روزنامه‌ها و مجلات نیاز به حساب کاربری است. شما با ساخت حساب کاربری علاوه بر دنبال کردن محتوای دلخواه خود، میتوانید به آرشیو و دانلود محتوا هم دسترسی پیدا کنید.")
                .customFont(.body)
                .padding(.horizontal)
                .multilineTextAlignment(.trailing)
            
            Spacer()
            Spacer()

            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Get Started", systemImage: "arrow.foqward")
                        .offset(x: 4, y:4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y:10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showSignIn = true
                        }
                    }
                }
            Spacer()
        }
    }
    
    func backgrandBlur () -> some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y:100)
            )
    }
}

#Preview {
    OnboardingView()
}
