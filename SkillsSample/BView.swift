//
//  BView.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

struct BView: View {
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationLink {
            CView()
        } label: {
            Group {
                Text("Open") +
                Text("C")
            }
            .font(.system(size: 30))
            .foregroundColor(.white)
            .frame(width: 200, height: 200)
            .background(.red)
        }
        .navigationTitle("B")
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.yellow)
                }
            }
        })
    }
}

#Preview {
    BView()
}
