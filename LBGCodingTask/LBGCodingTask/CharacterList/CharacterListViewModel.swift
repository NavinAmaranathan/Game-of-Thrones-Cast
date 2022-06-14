//
//  CharacterListViewModel.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import Foundation

protocol CharacterListViewModelData {
    var isReachable: Bool { get }
    func getCharacterList(for urlString: String) async throws -> Characters?
    func getRowModel(item: Character) -> CharacterCellModel
    func getSelectedCharacterModel(listItem: Character) -> CharacterDetailModel
}

class CharacterListViewModel: CharacterListViewModelData {

    // MARK: Properties
    private var charactersApi: CharactersAPI?
    private var monitor = NetworkMonitor.shared
    var isReachable: Bool {
        monitor.isReachable
    }

    // MARK: Initialiser
    init(characterAPI: CharactersAPI) {
        self.charactersApi = characterAPI
    }

    /// Fetches the list of characters from server
    /// - Parameter urlString: API endpoint for characters
    /// - Returns: List of characters
    func getCharacterList(for urlString: String) async throws -> Characters? {

        guard let apiRequest = charactersApi else {
            throw APIError.invalidRequest
        }
        let apiLoader = APILoader(apiHandler: apiRequest)
        guard let url = URL(string: urlString) else {
            throw APIError.invalidUrl
        }
        do {
            return try await apiLoader.loadAPIRequest(requestData: url)
        } catch {
            throw APIError.failure(message: error.localizedDescription)
        }
    }

    ///  Get the  character details from table view selection
    /// - Parameter listItem: Total character object
    /// - Returns: Specific character detail model
    func getSelectedCharacterModel(listItem: Character) -> CharacterDetailModel {
        return CharacterDetailModel(fullName: listItem.fullName,
                                    firstName: listItem.firstName,
                                    lastName: listItem.lastName,
                                    familyName: listItem.family,
                                    titleLabel: listItem.title,
                                    characterImage: listItem.imageURL)
    }

    /// Get the data to display each cell in tableview
    /// - Parameter item: Individual character data
    /// - Returns: data needed for the cell
    func getRowModel(item: Character) -> CharacterCellModel {
        return CharacterCellModel(name: item.fullName,
                                  image: item.imageURL)
    }
}
