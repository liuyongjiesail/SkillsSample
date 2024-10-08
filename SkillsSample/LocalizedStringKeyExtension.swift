//
//  LocalizedStringKeyExtension.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/10/8.
//

import Foundation
import SwiftUI

extension LocalizedStringKey {

    var stringValue: String {
        NSLocalizedString(self.stringKey, comment: "")
    }
    
    private var stringKey: String {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String ?? ""
    }
}
