//
//  SecondTabModel.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 24.09.2022.
//

import Foundation

struct SecondTabModel: Codable {
    let albumId, id: Int
    let url, thumbnailUrl, title: String

    enum CodingKeys: String, CodingKey {
        case id, title, url, albumId, thumbnailUrl
        
    }
}
