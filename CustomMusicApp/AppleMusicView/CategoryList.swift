//
//  CategoryList.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/18/24.
//

import SwiftUI



// 카테고리 리스트
struct CategoryList: View {
    // 리스트
    var list: GenreModel
    
    init(list: GenreModel) {
        self.list = list
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Text(list.attributes.name ?? "")
            
            Spacer()
            
            Text(list.attributes.parentName ?? "")
        }
        .onAppear() {
            print("list = \(list)")
        }
    }
}

//#Preview {
//    CategoryList()
//}
