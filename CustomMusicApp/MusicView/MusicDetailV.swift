//
//  MusicDetailV.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/25/24.
//

import SwiftUI
import MusicKit

/// 노래 상세화면 뷰
struct MusicDetailV: View {
    // 노래
    var song: MusicModel
    // init
    init(song: MusicModel) {
        self.song = song
    }
    
    /// UI
    var body: some View {
//        NavigationLink {
//            MusicPlayerView(song: song)
//        } label: {
//            Text(song.albumTitle ?? "not albumTitle")
//        }
        
        VStack {
            contentView
        }
        .navigationTitle(song.artistName)
        .onAppear() {
            print("song = \(song)")
        }
    }
    
    /// 내용
    var contentView: some View {
        VStack(spacing: 8) {
            AsyncImage(url: song.artWork) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 300, height: 300)
            
            Text(song.albumTitle ?? "not albumTitle")
                .font(.title2)
            
            Text(song.artistName)
                .font(.title3)
            
            
            
            
            Spacer()
        }
    }
}

//#Preview {
//    MusicDetailV()
//}
