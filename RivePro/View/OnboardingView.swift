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
    
    
    var body: some View {
        ZStack {
            backgrandBlur()
            
            VStack {
                Text("خیلی خوش آمدید، لطفا حساب باز کنید")
                    .customFont(.largeTitle)
                    .frame(width: 260)
                    .multilineTextAlignment(.trailing)
                
                Text("برای دنبال کردن روزنامه‌ها و مجلات نیاز به حساب کاربری است. شما با ساخت حساب کاربری علاوه بر دنبال کردن محتوای دلخواه خود، میتوانید به آرشیو و دانلود محتوا هم دسترسی پیدا کنید.")
                    .customFont(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.trailing)
                
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
                    }
            }
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
