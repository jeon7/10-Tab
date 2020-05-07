//
//  ViewController.swift
//  10 Tab
//
//  Created by Gukhwa Jeon on 07.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

