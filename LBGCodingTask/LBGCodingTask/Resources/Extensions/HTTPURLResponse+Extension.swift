//
//  HTTPURLResponse+Extension.swift
//  LBGCodingTask
//
//  Created by Navi on 13/06/22.
//

import Foundation

extension HTTPURLResponse {

    func isValid() -> Bool {
        (200...299).contains(self.statusCode) ? true : false
    }
}
