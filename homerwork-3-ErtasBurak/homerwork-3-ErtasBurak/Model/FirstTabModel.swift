//
//  FirstTabModel.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 23.09.2022.
//

import Foundation

struct FirstTabModel: Codable {
    let userId, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case id, title, body, userId
    }
}
