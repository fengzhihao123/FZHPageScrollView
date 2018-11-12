//
//  SecondViewController.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/7.
//  Copyright © 2018 冯志浩. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let fzh_button = UIButton(type: .custom)
        fzh_button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        fzh_button.backgroundColor = UIColor.blue
        fzh_button.setTitle("second", for: .normal)
        view.addSubview(fzh_button)
    }
    
}
