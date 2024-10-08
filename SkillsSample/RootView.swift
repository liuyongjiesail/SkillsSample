//
//  RootView.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

struct RootView: View {
    
    @State var selection:Int = 0
    
    init() {
        
        // 设置选中和非选中文字颜色
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.blue]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                AView()
                    .tabItem {
                        Label(
                            title: { Text("A") },
                            icon: { Image(systemName: selection == 0 ? "book.pages.fill" : "book.pages") }
                        )
                    }
                    .tag(0)
                DView()
                    .tabItem {
                        Label(
                            title: { Text("D") },
                            icon: { Image(systemName: selection == 1 ? "sun.rain.circle.fill" : "sun.rain.circle") }
                        )
                    }
                    .tag(1)
                FView()
                    .tabItem {
                        Label(
                            title: { Text("F") },
                            icon: { Image(systemName: selection == 2 ? "moon.dust.circle.fill" : "moon.dust.circle") }
                        )
                    }
                    .tag(2)
            }
        }
    }
}

#Preview {
    RootView()
}
