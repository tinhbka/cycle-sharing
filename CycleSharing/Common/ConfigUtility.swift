//
//  ConfigUtility.swift
//  Anista
//
//  Created by haiphan on 03/07/2021.
//

import Foundation
import UIKit

class ConfigUtility {
    static let shared = ConfigUtility()

    @Storage(key: "isSkippedHomeTutorial", defaultValue: false)
    var isSkippedHomeTutorial: Bool

    @Storage(key: "isSkippedCartTutorial", defaultValue: false)
    var isSkippedCartTutorial: Bool
}
