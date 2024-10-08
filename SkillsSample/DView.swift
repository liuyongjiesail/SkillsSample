//
//  DView.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

struct DView: View {
    
    var title:LocalizedStringKey = "Test Title"
    var message:LocalizedStringKey = "Test Message"

    var key: String = "Created by %@ on %@"
    
    var body: some View {
        Text("D")
        Text("Created by \(title.stringValue) on \(Date())")
    }
}

#Preview {
    DView()
}
