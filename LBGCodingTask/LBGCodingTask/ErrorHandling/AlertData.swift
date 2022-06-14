//
//  AlertData.swift
//  LBGCodingTask
//
//  Created by Navi on 13/06/22.
//

import Foundation

/// Basic Data required for showing an error alert
protocol AlertData: Error {
    var title: String { get }
    var description: String { get }
    var actionTitle: String { get }
}
