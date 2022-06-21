//
//  Constants.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import Foundation

enum Constants {
    static let appTitle = "Cast"
    static let rowHeight = 120.0
    static let customCellIdentifier = "custom_cell"
    static let customCellNibName = "CharacterCell"
    static let systemImagePhoto = "photo"
    static let systemImagePerson = "person"
}

enum APIEndPoints: String {
    case characters = "https://thronesapi.com/api/v2/Characters"
    case continents = "https://thronesapi.com/api/v2/Continents"
}

enum StoryboardIdentifiers: String {
    case characterList = "character_list"
    case characterDetail = "character_detail"
}

enum NotificationNames: String {
    case connectivityIdentifier = "NetworkConnectivityNotification"
}
