//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Tommy Hansen on 27/03/2019.
//  Copyright © 2019 Tommy Hansen. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
