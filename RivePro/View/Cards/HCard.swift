//
//  HCard.swift
//  RivePro
//
//  Created by Sothesom on 24/10/1403.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 8){
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading )
                
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth:.infinity, maxHeight: 110)
        .background(section.color)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .foregroundColor(.white)
    }
}

#Preview {
    HCard(section: courseSections[0])
}
