//
//  ViewController.swift
//  ImageFormat
//
//  Created by Bondar Yaroslav on 2/17/18.
//  Copyright © 2018 Bondar Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for file in ["1.jpg", "2.png", "3.gif", "4.svg", "5.TIF", "6.webp", "7.HEIC"] {
            if let data = Data(bundleFileName: file) {
                print(file, ImageFormat.get(from: data))
            }
        }
    }
}

//Data+Init
extension Data {
    /// Example
    /**
     if let data = Data(bundleFileName: "1.jpg") { }
     */
    init?(bundleFileName: String) {
        guard let bundlePath = Bundle.main.path(forResource: bundleFileName, ofType: "") else {
            return nil
        }
        try? self.init(contentsOf: URL(fileURLWithPath: bundlePath), options: .mappedIfSafe)
    }
}
