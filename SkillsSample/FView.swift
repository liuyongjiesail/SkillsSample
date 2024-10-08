//
//  FView.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

struct FView: View {
    var body: some View {
        VStack {
            Spacer()
            UIKitScrollView()
            Spacer()
        }
        
//        ZoomableImageView(imageName: "file-6113d5f8845dc")
//            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .edgesIgnoringSafeArea(.all) // 忽略安全区域，确保全屏展示
    }
}

#Preview {
    FView()
}

struct UIKitScrollView: UIViewRepresentable {

    var scrollView = UIScrollView()
    var imageView = UIImageView(image: UIImage(named: "file-6113d5f8845dc"))
    // 配置视图
    func makeUIView(context: Context) -> UIScrollView {
        scrollView.backgroundColor = .lightGray
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.bouncesZoom = true
        scrollView.delegate = context.coordinator
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        
        let image = UIImage(named: "file-6113d5f8845dc")!
        imageView.frame = CGRect(x: 0, y: UIScreen.main.bounds.width, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / image.size.width * image.size.height)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        
        scrollView.frame = imageView.bounds

        scrollView.addSubview(imageView)
        
        return scrollView
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: UIKitScrollView
        
        init(parent: UIKitScrollView) {
            self.parent = parent
        }
        
        // 指定可缩放的视图
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return parent.imageView
        }
    }

    // 更新视图
    func updateUIView(_ uiView: UIScrollView, context: Context) {
//        scrollView.contentSize = imageView.frame.size
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
