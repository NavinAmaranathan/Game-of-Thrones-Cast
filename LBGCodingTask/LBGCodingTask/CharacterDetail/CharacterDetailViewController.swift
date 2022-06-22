//
//  CharacterDetailViewController.swift
//  LBGCodingTask
//
//  Created by Navi on 10/06/22.
//

import UIKit
import SDWebImage

protocol CharacterDetailViewProvider {
    var fullName: String { get }
    var firstName: String { get }
    var lastName: String { get }
    var family: String { get }
    var title: String { get }
    var imageURL: String { get }
}

class CharacterDetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet private var firstName: UILabel!
    @IBOutlet private var lastName: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var family: UILabel!
    @IBOutlet private var imageView: UIImageView! {
        didSet {
            imageView.makeRoundCorners()
        }
    }
    @IBOutlet private var footerView: UIView! {
        didSet {
            footerView.makeRoundCorners()
        }
    }

    // MARK: Properties

    var model: CharacterDetailDataModel?

    // MARK: Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // MARK: Private Methods

    /// Updates the UI with the model values
    private func updateUI() {
        guard let dataModel = model?.provider else { return }
        title = dataModel.fullName
        firstName.text = dataModel.firstName
        lastName.text = dataModel.lastName
        titleLabel.text = dataModel.title
        family.text = dataModel.family
        imageView.sd_setImage(with: URL(string: dataModel.imageURL),
                              placeholderImage: UIImage(systemName: Constants.systemImagePerson),
                              options: .continueInBackground,
                              context: nil)
    }
}
