//
//  CustomFontModif.swift
//  RivePro
//
//  Created by Sothesom on 19/10/1403.
//

// این کد اولیه است

//struct CustomFont: ViewModifier {
//    var textStyle: TextStyle
//    func body(content: Content) -> some View {
//            switch textStyle {
//            case .title:
//                content.font(.custom("Peyda-Black", size: 50, relativeTo: .title))
//            case .bady1:
//                content.font(.custom("Peyda-Regular", size: 17, relativeTo: .body))
//            case .body2:
//                content.font(.custom("Peyda-Semibold", size: 17, relativeTo: .caption))
//            }
//        }
//}
//
//extension View {
//    func customFont(_ textStyle: TextStyle) -> some View {
//        modifier(CustomFontModif(textStyle: textStyle))
//    }
//}
//
//enum TextStyle {
//    case title
//    case bady1
//    case body2
//}
//

/// حالت استاندارد

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    
    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return "Peyda-Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Peyda-Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Peyda-Semibold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .headline:
            return 17
        case .subheadline:
            return 15
        case .subheadline2:
            return 15
        case .footnote:
            return 13
        case .footnote2:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 12
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .subheadline2:
            return .subheadline
        case .footnote:
            return .footnote
        case .footnote2:
            return .footnote
        case .caption:
            return .caption
        case .caption2:
            return .caption
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: relative))
    }
}


extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}


enum TextStyle {
    case largeTitle
    case title
    case title2
    case title3
    case body
    case headline
    case subheadline
    case subheadline2
    case footnote
    case footnote2
    case caption
    case caption2
}
