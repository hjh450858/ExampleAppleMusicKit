//
//  MusicModel.swift
//  CustomMusicApp
//
//  Created by 황재현 on 5/9/24.
//

import Foundation
import MusicKit

/// 노래 모델
struct MusicModel: Codable {
    /// 아이디
    var id: String
    /// 아티스트
    var artistName: String
    /// 앨범 제목
    var albumTitle: String?
    /// 아티스트 이미지 URL
    var artistUrl: URL?
    /// ??
    var artWork: URL?
    /// 길이
    var duration: TimeInterval?
    /// Apple Music에서 노래를 공유하기 위한 URL
    var shareUrl: URL?
    /// 노래의 특정 오디오를 변형
//    var audioVariants: [AudioVariant]?
    
    var description: String {
        return "id = \(id), artistName = \(artistName), albumTitle = \(albumTitle), artistUrl = \(artistUrl), artWork = \(artWork), duration = \(duration), shareUurl = \(shareUrl)"
    }
    
    init(data: Song, width: Int, height: Int) {
        self.id = data.id.description
        self.artistName = data.artistName
        self.albumTitle = data.title
        self.artistUrl = data.artistURL
        self.artWork = data.artwork?.url(width: width, height: height)
        self.duration = data.duration
        self.shareUrl = data.url
//        self.audioVariants = data.audioVariants
    }
}
