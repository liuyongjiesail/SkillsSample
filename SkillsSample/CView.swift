//
//  CView.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

struct CView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var isAlert:Bool = false
    
    var title: LocalizedStringKey = "Test Title"
    var message: LocalizedStringKey = "Test Message"

    var body: some View {
        
        VStack {
            Button(action: {
//                isAlert = true
                UIViewController.currentViewController()?.showAlert(title: title.stringValue, message: message.stringValue)
            }, label: {
                Group {
                    Text("Open") +
                    Text("Alert")
                }
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .background(.red)
            })
            
        }
        .navigationTitle("C")
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
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text("Test Title"), message: Text("Test Message"))
        })
        
    }
}

#Preview {
    CView()
}


extension UIViewController {
    
    static func currentViewController() -> UIViewController? {
        var current = UIApplication.shared.keyWindow?.rootViewController
        while (current?.presentedViewController != nil)  {
            current = current?.presentedViewController
        }
        
        if let tabbar = current as? UITabBarController, tabbar.selectedViewController != nil {
            current = tabbar.selectedViewController
        }
        
        while let navigation = current as? UINavigationController, navigation.topViewController != nil  {
            current = navigation.topViewController
        }
        return current
    }
    
    func showAlert(title:String, message:String, actionTitles:Array<Any> = [], preferredStyle: UIAlertController.Style = .alert, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        
        if (actionTitles.count != 0) {
            for i in 0..<actionTitles.count {
                alert.addAction(UIAlertAction(title: actionTitles[i] as? String, style: .default, handler: actionHandler))
            }
        } else if preferredStyle == .alert {
            alert.addAction(UIAlertAction(title: "I got it", style: .cancel, handler: actionHandler))
        }
        if preferredStyle == .actionSheet {
            alert.addAction(UIAlertAction(title:"cancel", style: .cancel, handler: actionHandler))
        }
        self.present(alert, animated: true, completion: nil)
    }
}
