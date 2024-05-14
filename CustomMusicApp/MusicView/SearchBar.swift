//
//  CustomSearchBar.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/25/24.
//

import SwiftUI
import UIKit
import Combine

/// 검색바
//struct CustomSearchBar: View {
//    
//    @Binding var text: String
//    
//    var onCommit: (() -> Void)?
//    
//    init(text: Binding<String>, onCommit: (() -> Void)? = nil) {
//        self._text = text
//        self.onCommit = onCommit
//    }
//    
//    var body: some View {
//        HStack {
//            TextField("search", text: $text, onCommit: {
//                onCommit?()
//            })
//                
//        }
//        .padding(.horizontal, 16)
//        .foregroundColor(.secondary)
//        .background(Color(.secondarySystemBackground))
//        .cornerRadius(8)
//    }
//    
//    func hideKeyboard() {
//        
//    }
//}


/// 검색바
struct SearchBar: View {
    @Binding var text: String
    
    var onCommit: (() -> Void)?
    
    init(text: Binding<String>, onCommit: (() -> Void)? = nil) {
        self._text = text
        self.onCommit = onCommit
    }
    
    var body: some View {
        HStack {
            HStack {
                // 돋보기 이미지
                Image(systemName: "magnifyingglass")
                // 검색란
                TextField("search", text: $text, onCommit: {
                    onCommit?()
                })
                    .foregroundColor(.primary)
                
                
                if !text.isEmpty {
                    // "X" 버튼
                    Button(action: { self.text = "" }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


//#Preview {
//    CustomSearchBar()
//}
