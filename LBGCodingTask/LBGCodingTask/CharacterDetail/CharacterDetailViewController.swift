//
//  CharacterDetailViewController.swift
//  LBGCodingTask
//
//  Created by Navi on 10/06/22.
//

import UIKit
import SDWebImage

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

    var model: CharacterDetailModel?
    private var viewModel: CharacterDetailViewModelData = CharacterDetailViewModel()

    // MARK: Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        updateUI()
    }

    // MARK: Private Methods

    /// Updates the UI with the model values
    private func updateUI() {
        title = model?.fullName
        firstName.text = model?.firstName
        lastName.text = model?.lastName
        titleLabel.text = model?.titleLabel
        family.text = model?.familyName
        imageView.sd_setImage(with: URL(string: model!.characterImage),
                              placeholderImage: UIImage(systemName: "person"),
                              options: .continueInBackground,
                              context: nil)
    }
}

extension CharacterDetailViewController: CharacterDetailViewModelDelegate {}
