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
        title = "display"
        view.backgroundColor = UIColor.white
        setupPageScrollView()
    }
    
    func setupPageScrollView() {
        
        var titles = [String]()
        var vcs = [UIViewController]()
        
        for index in 0...20 {
            titles.append("index\(index)")
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.random
            vcs.append(vc)
        }
        
        let pageView = FZHPageScrollView(frame: CGRect(x: 0, y: 64, width: kScreenW, height: kScreenH - 64), pageScrollViewSuperVC: self)
        pageView.backgroundColor = UIColor.red
        pageView.titles = titles
//        let vc = SecondViewController()
//        let vc1 = FirstTableViewController()
//        let vc2 = ThirdViewController()
        pageView.childVCs = vcs
        
        view.addSubview(pageView)
    }
    
    override var shouldAutomaticallyForwardAppearanceMethods: Bool { return false }
    
    deinit {
        print("=============deinit")
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
