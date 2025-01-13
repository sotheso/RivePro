//
//  HomeView.swift
//  RivePro
//
//  Created by Sothesom on 24/10/1403.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView{
                content
            }
        }
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 0){
            Text("Course")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // نشانگر رو نشون نده
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(courses) { course in
                        VCard(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            
            // --------------------------------------------
            Text("Recent")
                .customFont(.title3)
                .padding(.horizontal, 20)
            
            VStack(spacing: 20) {
                ForEach(courseSections) { section in
                    HCard(section: section)
                }
            }
            .padding(20)
        }

    }
}

#Preview {
    HomeView()
}
