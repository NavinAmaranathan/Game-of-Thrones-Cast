//
//  CharacterCell.swift
//  LBGCodingTask
//
//  Created by Navi on 10/06/22.
//

import UIKit
import SDWebImage

protocol CharacterCellViewProvider {
    var fullName: String { get }
    var imageURL: String { get }
}

class CharacterCell: UITableViewCell {

    // MARK: Static properties
    static let identifier: String = Constants.customCellIdentifier
    static func nib() -> UINib {
        return UINib(nibName: Constants.customCellNibName, bundle: nil)
    }

    // MARK: Outlets
    @IBOutlet private var characterImage: UIImageView!
    @IBOutlet private var characterName: UILabel!

    // MARK: Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.makeRoundCorners(byRadius: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    // MARK: UI update methods
    /// Updates the UI elements with model values
    /// - Parameter model: Model data required by the cell components
    func configure(with model: CharacterCellViewProvider) {
        characterName.text = model.fullName
        characterImage.sd_setImage(with: URL(string: model.imageURL),
                                   placeholderImage: UIImage(systemName: Constants.systemImagePhoto),
                                   options: .continueInBackground,
                                   context: nil)
    }
}
