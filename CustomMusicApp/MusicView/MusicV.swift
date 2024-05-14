//
//  MusicV.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/25/24.
//

import SwiftUI
import MusicKit
import Combine


// MARK: - Apple Music 구독 안하면 노래 실행이 안됨

/// 뮤직킷을 이용한 뷰
struct MusicV: View {
    /// 노래
    @State private var songs = [MusicModel]()
    /// 검색내용
    @State private var searchText = ""
    /// 로딩중체크
    @State private var isLoading: Bool = false
    
    /// UI
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 검색바
                SearchBar(text: $searchText) {
                    print("onCommit")
                    searchMusic()
                }
                
                if isLoading {
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                } else {
                    contentView
                }
            }
            .navigationTitle("노래검색")
        }
    }
    
    /// 내용
    var contentView: some View {
        VStack {
            // 검색 리스트
            List(songs, id: \.id) { song in
                NavigationLink(destination: MusicDetailV(song: song)) {
                    HStack(alignment: .top, spacing: 8) {
                        AsyncImage(url: song.artWork) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 75, height: 75)
                        .cornerRadius(4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(song.albumTitle ?? "not title")
                                .font(.title3)
                            Text(song.artistName)
                                .font(.footnote)
                        }
                    }
                }
            }
//            .onTapGesture {
//                print("onTap")
//                // 키보드 숨김
//                hideKeyboard()
//            }
        }
    }
    
    
    /// 노래 검색
    func searchMusic() {
        print("searchMusic() - searchText = \(searchText)")
        self.isLoading = true
        Task {
            let status = await MusicAuthorization.request()
            
            switch status {
            case .authorized:
                do {
                    var request = MusicCatalogSearchRequest(term: searchText, types: [Song.self])
                    
                    // 최대 25개
                    request.limit = 25
                    request.offset = 0
                    request.includeTopResults = false
                    
                    let result = try await request.response()

                    print("result = \(result)")
                    
                    self.songs = result.songs.compactMap({ song in
                        return .init(data: song, width: 300, height: 300)
                    })
                    
                    self.isLoading = false
                } catch {
                    print("error = \(error.localizedDescription)")
                }
            default:
                break
            }
        }
    }
    
    /// 노래 추가
    func addMusic() {
        print("addMusic")
    }
    
    
    func test() async throws {
        let request = MusicLibrarySearchRequest(term: searchText, types: [Album.self, Song.self])
        let response = try await request.response()
        print("response = \(response)")
    }
}

//#Preview {
//    MusicV()
//}
