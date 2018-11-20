//
//  ThirdViewController.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/7.
//  Copyright © 2018 冯志浩. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let fzh_button = UIButton(type: .custom)
        fzh_button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        fzh_button.backgroundColor = UIColor.blue
        fzh_button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        fzh_button.setTitle("third", for: .normal)
        view.addSubview(fzh_button)
    }
    
    @objc func buttonClick() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
