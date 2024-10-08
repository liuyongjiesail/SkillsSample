//
//  AView.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

struct AView: View {
    var body: some View {
        NavigationLink {
            BView()
        } label: {
            Group {
                Text("Open") +
                Text("B")
            }
            .font(.system(size: 30))
            .foregroundColor(.white)
            .frame(width: 200, height: 200)
            .background(.red)
        }
        .navigationTitle("A")
    }
}

#Preview {
    AView()
}
