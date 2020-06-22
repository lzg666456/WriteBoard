//
//  ContentView.swift
//  example
//
//  Created by zglee on 6/22/20.
//  Copyright © 2020 zglee. All rights reserved.
//

import SwiftUI
import WriteBoard

struct ControllerPage<T: UIViewController> : UIViewControllerRepresentable {
    
//    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ControllerPage>) -> UIViewController {
        return T()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ControllerPage>) {
        debugPrint("\(#function)：\(type(of: T.self))")
    }
    
}


struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            
//            Toggle()
//
//            Slider()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
         ControllerPage<WBViewController>()
    }
}
