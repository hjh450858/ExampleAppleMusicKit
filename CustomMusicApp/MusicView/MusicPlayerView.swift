//
//  MusicPlayerView.swift
//  CustomMusicApp
//
//  Created by 황재현 on 5/8/24.
//

import SwiftUI
import Combine


/// 노래 플레이어 뷰
struct MusicPlayerView: View {
    
    /// 노래
    var song: MusicModel
    
    init(song: MusicModel) {
        self.song = song
    }
    
    /// UI
    var body: some View {
        VStack {
            contentView
        }
    }
    
    
    /// 내용
    var contentView: some View {
        VStack {
            Text(song.albumTitle ?? "not albumTitle")
        }
    }
}

//#Preview {
//    MusicPlayerView()
//}
