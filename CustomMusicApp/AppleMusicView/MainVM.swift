//
//  MainVM.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/18/24.
//

import Foundation
import SwiftUI
import Combine
import MusicKit
import Alamofire


/// 메인 뷰모델
class MainVM: ObservableObject {
    /// 데이터
    @Published var data = [GenreModel]()
    
    // 한국 카테고리 url
    lazy var categoryUrl = URL(string: BASE_URL + "/v1/catalog/kr/genres")!
    
//    var sendData = PassthroughSubject<[GenreModel], Never>()
    
    /// 데이터 가져옴
    func getData() {
        AF.request(categoryUrl).validate().responseDecodable(of: GenreDecodable.self) { response in
            print("getData - response = \(response)")
            guard let result = response.value else { return }
            print("getData - result = \(result.data.count)")
            self.data = result.data
        }
    }
    
    /// 노래 검색
    func fetchMusic(_ txt: String = "Taylor Swift") {
        
        Task {
            // Request permission
            let status = await MusicAuthorization.request()

            switch status {
            case .authorized:
                // Request -> Response
                do {
                    var request = MusicCatalogSearchRequest(term: txt, types: [Song.self])
                    request.limit = 25
                    request.offset = 1
                    
                    let result = try await request.response()

                    print("result = \(result)")
                } catch {
                    print(String(describing: error))
                }
            default:
                break
            }
        }
    }
}
