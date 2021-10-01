//
//  HeroModel.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 30.09.21.
//

import Foundation

// MARK: - Model
struct Hero: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var thumbnail: HeroImage?
}

struct HeroImage: Codable {
    let path: String
    let format: String
    var url: URL? {
        let imageSizeVariant = "portrait_uncanny"
        let path = path + "/" + imageSizeVariant + "." + format
        return URL(string: path)
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case format = "extension"
    }
}

struct Object: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: HeroData
}

struct HeroData: Codable {
    let results: [Hero]
}
