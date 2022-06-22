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
}
