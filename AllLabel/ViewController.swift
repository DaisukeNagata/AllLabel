//
//  ViewController.swift
//  AllLabel
//
//  Created by 永田大祐 on 2018/12/22.
//  Copyright © 2018 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var formattedJPString: AllLabel!
    @IBOutlet weak var jpyLabel         : AllLabel!
    @IBOutlet weak var usdLabel         : AllLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        formattedJPString.text = 123456789.formattedJPString
        jpyLabel.text          = 123456789.JPYString
        usdLabel.text          = 123456789.USDString
    }

    override func viewDidLayoutSubviews() {
        jpyLabel.textShadow(shadowBlurRadius: 5.0, shadowColor: .green, shadowOffset: CGSize(width: 25.0, height: jpyLabel.frame.height/4), textColor: .black)
    }
}
