//
//  CharacterListViewModelTests.swift
//  LBGCodingTaskTests
//
//  Created by Navi on 11/06/22.
//

import XCTest
@testable import LBGCodingTask

class CharacterListViewModelTests: XCTestCase {

    private var sut_viewModel: CharacterListViewModelData?

    override func setUpWithError() throws {
        sut_viewModel = CharacterListViewModel(characterAPI: CharactersAPI())
    }

    override func tearDownWithError() throws {
        sut_viewModel = nil
    }

    func test_GetCharacters_Success() async throws {
        let expectation = XCTestExpectation(description: #function)
        do {
            guard let result = try await sut_viewModel?.getCharacterList(for: APIEndPoints.characters.rawValue) else {
                XCTFail("test_fetch_API_Data failed")
                return
            }
            let firstCharacter = result.first
            XCTAssertEqual(firstCharacter?.fullName, Values.sampleCharacter.fullName)
            expectation.fulfill()
        } catch {
            XCTFail("test_fetch_API_Data failed")
            throw error
        }
    }

    func test_fetch_Characters_InvalidUrl_Failure() async throws {
        let expectation = XCTestExpectation(description: #function)
        do {
            try await sut_viewModel?.getCharacterList(for: "")
        } catch let error as APIError {
            XCTAssertEqual(error.title, "Sorry")
            XCTAssertEqual(error.description, "We are checking")
            expectation.fulfill()
        }
    }

    func test_Show_CharacterDetail_Screen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let sut_DetailViewController = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifiers.characterDetail.rawValue) as? CharacterDetailViewController {
            let model = CharacterDetailDataModel(provider: Values.sampleCharacter)
            sut_DetailViewController.model = model
            XCTAssertEqual(sut_DetailViewController.model?.provider.fullName, Values.sampleCharacter.fullName)
            sut_DetailViewController.loadViewIfNeeded()
        }
    }
}

extension CharacterListViewModelTests {

    enum Values {
        static var sampleCharacter = Character(id: 0,
                                               firstName: "Daenerys",
                                               lastName: "Targaryen",
                                               fullName: "Daenerys Targaryen",
                                               title: "Mother of Dragons",
                                               family: "House Targaryen",
                                               image: "https://demo.character.image",
                                               imageURL: "https://demo.character.image")
    }
}
