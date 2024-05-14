//
//  MainV.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/18/24.
//

import SwiftUI
import MusicKit
import Combine
import MediaPlayer

/// 메인 뷰
struct MainV: View {
    /// 뷰모델
    @ObservedObject var vm = MainVM()
    /// 리스트 데이터
    @State private var listData: [GenreModel] = []
    
    
    
    // MARK: - body
    var body: some View {
        NavigationView(content: {
            // 리스트
            List(listData, id: \.id) { data in
                // 카테고리 리스트
                NavigationLink(destination: MusicListV(data: data)) {
                    CategoryList(list: data)
                }
            }
            .navigationTitle("노래 리스트")
        })
        .onAppear() { vm.fetchMusic() }
        .onReceive(vm.$data, perform: { data in
            print("onReceive - data = \(data)")
            self.listData = data
        })
    }
}

//#Preview {
//    MainV()
//}
