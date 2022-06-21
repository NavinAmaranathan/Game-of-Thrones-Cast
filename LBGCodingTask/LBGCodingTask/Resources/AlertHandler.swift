//
//  AlertHandler.swift
//  LBGCodingTask
//
//  Created by Navi on 13/06/22.
//

import Foundation
import UIKit

final class AlertHandler {

    static let shared = AlertHandler()
    private init() { }

    /// Used to display an error alert when API fails
    /// - Parameters:
    ///   - baseVC: Rootview controller from which alert was triggered.
    ///   - type: Type of API Error that occured.
    ///   - completionHandler: To Handle tasks after completion.
    func show(over baseVC: UIViewController, type: APIError, completionHandler: (() -> Void)? = nil) {
        presentAlert(over: baseVC, type: type, completionHandler: completionHandler)
    }

    /// Used to show alert for a network failure case
    /// - Parameters:
    ///   - baseVC: Rootview controller from which alert was triggered.
    ///   - type: Type of Network Error that occured.
    ///   - completionHandler: To Handle tasks after completion.
    func show(over baseVC: UIViewController, type: NetworkError, completionHandler: (() -> Void)? = nil) {
        presentAlert(over: baseVC, type: type, completionHandler: completionHandler)
    }

    /// Handles alert presentation
    private func presentAlert(over baseVC: UIViewController, type: AlertData, completionHandler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: type.title, message: type.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: type.actionTitle, style: .destructive, handler: nil))
            baseVC.present(alert, animated: true)
            completionHandler?()
        }
    }
}
