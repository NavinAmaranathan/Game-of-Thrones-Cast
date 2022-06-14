//
//  NetworkMonitor.swift
//  LBGCodingTask
//
//  Created by Navi on 13/06/22.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true

    /// Starts to monitor the network connectivity
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                debugPrint("Connected")
            } else {
                debugPrint("Not Connected")
            }
            NotificationCenter.default.post(name: NSNotification.Name(NotificationNames.connectivityIdentifier.rawValue),
                                                    object: nil)
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    /// Stops to monitor the network connectivity
    func stopMonitoring() {
        monitor.cancel()
    }
}
