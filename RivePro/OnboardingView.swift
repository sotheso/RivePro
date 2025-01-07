//
//  OnboardingView.swift
//  RivePro
//
//  Created by Sothesom on 18/10/1403.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    var body: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background {
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y:100)
            }
    }
}

#Preview {
    OnboardingView()
}
