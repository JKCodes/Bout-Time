//
//  WebViewController.swift
//  Bout Time
//
//  Created by Joseph Kim on 12/31/16.
//  Copyright © 2016 Joseph Kim. All rights reserved.
//

import UIKit

class WebViewController : UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loads the web view
        webView.loadRequest(URLRequest(url: URL(string: url)!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// This just controls the action for the upper right 'X' button
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
