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
            XCTAssertEqual(firstCharacter?.fullName, Values.sampleCharacterDetail.fullName)
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

    func test_CharacterDetailModel_Creation() {
        let sutCharacterDetail = sut_viewModel?.getSelectedCharacterModel(listItem: Character(id: 0,
                                                                                              firstName: "Daenerys",
                                                                                              lastName: "Targaryen",
                                                                                              fullName: "Daenerys Targaryen",
                                                                                              title: "Mother of Dragons",
                                                                                              family: "House Targaryen",
                                                                                              image: "https://demo.character.image",
                                                                                              imageURL: "https://demo.character.image"))
        XCTAssertEqual(sutCharacterDetail, Values.sampleCharacterDetail)
    }

    func test_CharacterCellModel_Creation() {
        let sutRow = sut_viewModel?.getRowModel(item: Character(id: 0,
                                                                firstName: "Daenerys",
                                                                lastName: "Targaryen",
                                                                fullName: "Daenerys Targaryen",
                                                                title: "Mother of Dragons",
                                                                family: "House Targaryen",
                                                                image: "https://demo.character.image",
                                                                imageURL: "https://demo.character.image"))
        XCTAssertEqual(sutRow, Values.sampleRow)
    }

    func test_Show_CharacterDetail_Screen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let sut_DetailViewController = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifiers.characterDetail.rawValue) as? CharacterDetailViewController {
            sut_DetailViewController.model = Values.sampleCharacterDetail
            XCTAssertEqual(sut_DetailViewController.model?.fullName, Values.sampleCharacterDetail.fullName)
            sut_DetailViewController.loadViewIfNeeded()
        }
    }
}

extension CharacterListViewModelTests {

    enum Values {
        static var sampleCharacterDetail: CharacterDetailModel = CharacterDetailModel(fullName: "Daenerys Targaryen",
                                                                                      firstName: "Daenerys",
                                                                                      lastName: "Targaryen",
                                                                                      familyName: "House Targaryen",
                                                                                      titleLabel: "Mother of Dragons",
                                                                                      characterImage: "https://demo.character.image")
        static var sampleRow: CharacterCellModel = CharacterCellModel(name: "Daenerys Targaryen",
                                                                      image: "https://demo.character.image")
    }
}
