//
//  DisplayViewController.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/7.
//  Copyright © 2018 冯志浩. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupPageScrollView()
    }
    
    func setupPageScrollView() {
        let pageView = FZHPageScrollView(frame: CGRect(x: 0, y: 64, width: kScreenW, height: kScreenH - 64), pageScrollViewSuperVC: self)
        pageView.backgroundColor = UIColor.red
        pageView.titles = ["斧王","露娜","月之女祭司"]
        let vc = SecondViewController()
        let vc1 = FirstTableViewController()
        let vc2 = ThirdViewController()
        pageView.childVCs = [vc, vc1, vc2]
        
        view.addSubview(pageView)
    }
    
    deinit {
        print("=============deinit")
    }
}
