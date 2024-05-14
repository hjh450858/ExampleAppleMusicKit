//
//  GenreModel.swift
//  CustomMusicApp
//
//  Created by 황재현 on 4/18/24.
//

import Foundation

/// 서버에서 내려주는 값
struct GenreDecodable: Decodable {
    let data: [GenreModel]
}

/// 사용할 데이터 형태
struct GenreModel: Codable {
    /// 아이디
    var id: String
    /// 타입
    var type: String
    /// 링크
    var href: String
    /// 속성
    var attributes: Attribute
    
}

/// 데이터 속성
struct Attribute: Codable {
    /// 타이틀?
    var parentName: String?
    /// 이름
    var name: String?
    /// 아이디
    var parentId: String?
}
