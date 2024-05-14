//
//  Ext_View.swift
//  CustomMusicApp
//
//  Created by 황재현 on 5/7/24.
//

import Foundation
import UIKit
import SwiftUI


// 화면 터치시 키보드 숨김
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

extension View {
    @ViewBuilder
    func hideIndicator() -> some View {
        if #available(iOS 16, *) {
            self.modifier(Ios16_HideIndicator())
        } else {
            self.modifier(Ios15_HideIndicator())
        }
    }
}


@available(iOS 16, *)
struct Ios16_HideIndicator: ViewModifier {
    func body(content: Content) -> some View {
        content.scrollIndicators(.hidden)
    }
}

struct Ios15_HideIndicator: ViewModifier {
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    func body(content: Content) -> some View {
        content
    }
}
