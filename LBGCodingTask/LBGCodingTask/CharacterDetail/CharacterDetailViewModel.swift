//
//  CharacterDetailViewModel.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import Foundation
import UIKit

protocol CharacterDetailViewModelDelegate: AnyObject {}

protocol CharacterDetailViewModelData {
    var delegate: CharacterDetailViewModelDelegate? { get set }
}

class CharacterDetailViewModel: CharacterDetailViewModelData {

    weak var delegate: CharacterDetailViewModelDelegate?
}
