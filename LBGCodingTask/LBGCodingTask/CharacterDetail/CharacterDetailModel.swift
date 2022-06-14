//
//  CharacterDetailModel.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import Foundation
import UIKit

struct CharacterDetailModel {
    let fullName: String
    let firstName: String
    let lastName: String
    let familyName: String
    let titleLabel: String
    let characterImage: String
}

extension CharacterDetailModel: Equatable {}
