//
//  User.swift
//  First
//
//  Created by Brent Le Comte on 21/12/2020.
//

import Foundation

struct User {
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradedNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}
