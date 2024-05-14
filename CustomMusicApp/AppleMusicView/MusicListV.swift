//
//  MusicListV.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/25/24.
//

import SwiftUI
import MusicKit
import MediaPlayer
import Combine



/// 뮤직 리스트 뷰
struct MusicListV: View {
    /// 데이터
    let data: GenreModel
    /// 뷰모델
    @ObservedObject var vm = MusicListVM()
    
    init(data: GenreModel) {
        self.data = data
    }
    
    var body: some View {
//        NavigationView(content: {
//            NavigationLink(destination: Text("Destination")) {
//                Text(data.attributes.name ?? "not name")
//            }
//        })
        Text(data.attributes.name ?? "not name")
        .onAppear() {
            print("data = \(data)")
        }
    }
}

//#Preview {
//    MusicListV()
//}
