//
//  CharacterModel.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import Foundation

typealias Characters = [Character]

struct Character: Decodable {
    let id: Int
    let firstName, lastName, fullName, title: String
    let family, image: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, fullName, title, family, image
        case imageURL = "imageUrl"
    }
}
