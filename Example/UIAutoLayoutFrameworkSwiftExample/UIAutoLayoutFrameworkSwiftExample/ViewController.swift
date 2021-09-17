//
//  ViewController.swift
//  UIAutoLayoutFrameworkSwiftExample
//
//  Created by 林俊男 on 2021/09/17.
//

import UIKit
import UIAutoLayoutFrameworkSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let version: String = calVersion()
        
        print("UIAutoLayoutFrameworkSwift Version:\(version), Screen width: \(kscreenWidth)")
        
        self.view.adaptScreenWidthType(type: .BSAdaptScreenWidthTypeAll, exceptViews: nil)
        // Do any additional setup after loading the view.
    }


}

