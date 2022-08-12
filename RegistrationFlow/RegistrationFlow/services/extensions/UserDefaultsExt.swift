//
//  UserDefaultsExt.swift
//  RegistrationFlow
//
//  Created by сергей on 6.08.22.
//

import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {

        case email
        case name
        case password

    }

    func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }

}

