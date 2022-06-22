//
//  CharacterListViewController+TableView.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import UIKit
import SkeletonView

// MARK: UITableViewDelegate methods

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let detailVC = storyboard?.instantiateViewController(
            withIdentifier: StoryboardIdentifiers.characterDetail.rawValue) as? CharacterDetailViewController else {
                return
            }
        let model = CharacterDetailDataModel(provider: characters[indexPath.row])
        detailVC.model = model
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: SkeletonTableViewDataSource methods

extension CharacterListViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier,
                                                       for: indexPath) as? CharacterCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: characters[indexPath.row])
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return CharacterCell.identifier
    }
}
