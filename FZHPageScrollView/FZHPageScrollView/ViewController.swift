//
//  ViewController.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/6.
//  Copyright © 2018 冯志浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let navi = UINavigationController(rootViewController: DisplayViewController())
        present(navi, animated: true, completion: nil)
    }
}

