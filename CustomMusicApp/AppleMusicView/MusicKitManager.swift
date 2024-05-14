//
//  APIManager.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/18/24.
//

import Foundation
import SwiftUI
import Alamofire
import Combine
import MusicKit



/// API 담당 매니저
class MusicKitManager {
    static let shared = MusicKitManager()
    // 장르 URL
    let categoryUrl = URL(string: "https://api.music.apple.com/v1/catalog/kr/genres")!
    
    /// 데이터 가져옴
    func getData() {
        AF.request(categoryUrl).validate().responseDecodable(of: GenreDecodable.self) { response in
            print("getData - response = \(response)")
            guard let result = response.value else { return }
            print("getData - result = \(result.data.count)")
            // TODO: - response(Genre) -> (GenreModel) 변환
        }
    }
}
