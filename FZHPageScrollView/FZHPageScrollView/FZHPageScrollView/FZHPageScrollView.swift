//
//  FZHPageScrollView.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/6.
//  Copyright © 2018 冯志浩. All rights reserved.
//

import UIKit

class FZHPageScrollView: UIView {
    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    
    //title
    private let titleScrollView = UIScrollView()
    var titles = [String]() {
        didSet {
            setupTitleViewData(titles: titles)
        }
    }
    private var titleButtons = [UIButton]()
    private var titleButtonFont: CGFloat = 16
    private var titleButtonMarginX: CGFloat = 5
    public var titleNormalFont = UIFont.systemFont(ofSize: 15)
    public var titleSelectFont = UIFont.systemFont(ofSize: 17)
    private var titleButtonH: CGFloat = 20
    //titleBottomSlider
    private let bottomSliderView = UIView()
    public let bottomSliderViewMarginY: CGFloat = 5
    public let bottomSliderViewBgColor = UIColor.yellow
    
    //contentView
    var contentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var childVCs = [UIViewController]() {
        didSet {
            contentCollectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleView()
        setupContentCollectionView()
    }
    
    //MARK: 设置titleView
    func setupTitleView() {
        titleScrollView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 50)
        titleScrollView.backgroundColor = UIColor.lightGray
        titleScrollView.showsHorizontalScrollIndicator = false
        titleScrollView.delegate = self
        addSubview(titleScrollView)
    }
    
    func setupTitleViewData(titles: [String]) {
        var buttonMarginX = titleButtonMarginX
        
        for index in 0..<titles.count {
            let title = titles[index]
            let titleButton = UIButton(type: .custom)
            let titleButtonW = title.calculateStringWidth(font: (titleButton.titleLabel?.font)!, height: titleButtonH)
            let titleButtonY = (titleScrollView.frame.height - titleButtonH)/2
            titleButton.frame = CGRect(x: buttonMarginX, y: titleButtonY, width: titleButtonW, height: titleButtonH)
            buttonMarginX = titleButton.frame.origin.x + titleButton.frame.size.width + titleButtonMarginX
            titleButton.backgroundColor = UIColor.blue
            titleButton.tag = titles.firstIndex(of: title)!
            titleButton.setTitle(title, for: .normal)
            titleButton.titleLabel?.font = titleNormalFont
            titleButton.addTarget(self, action: #selector(titleButtonClick(button:)), for: .touchUpInside)
            titleButtons.append(titleButton)
            titleScrollView.addSubview(titleButton)
        }
        setupBottomSliderView()
        titleScrollView.contentSize = CGSize(width: buttonMarginX, height: 0)
    }
    
    //MARK: bottomSliderView
    func setupBottomSliderView() {
        if let firstButton = titleButtons.first {
            let bottomSliderViewY = firstButton.frame.origin.y + firstButton.frame.size.height + bottomSliderViewMarginY
            bottomSliderView.frame = CGRect(x: 0, y: bottomSliderViewY, width: 50, height: 5)
            bottomSliderView.center.x = firstButton.center.x
            bottomSliderView.backgroundColor = bottomSliderViewBgColor
            titleScrollView.addSubview(bottomSliderView)
        }
    }
    
    //MARK: contentCollectionView
    func setupContentCollectionView() {
        let collectionViewH = frame.height - titleScrollView.frame.height
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW, height: collectionViewH)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        contentCollectionView = UICollectionView(frame: CGRect(x: 0, y: titleScrollView.frame.origin.y + titleScrollView.frame.height, width: kScreenW, height: collectionViewH), collectionViewLayout: layout)
        contentCollectionView.backgroundColor = UIColor.white
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        contentCollectionView.isPagingEnabled = true
        contentCollectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
        addSubview(contentCollectionView)
    }
    
    //MARK: event
    func setupBottomSliderViewX(tagetButton: UIButton) {
        bottomSliderView.center.x = tagetButton.center.x
    }
    
    @objc func titleButtonClick(button: UIButton) {
        setupBottomSliderViewX(tagetButton: button)
        contentCollectionView.selectItem(at: IndexPath(row: button.tag, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FZHPageScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
//        if scrollView is UICollectionView {
//            let scrollDirection = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
//
//            let contentOffsetX = scrollView.contentOffset.x
//            let screenScale = contentOffsetX.truncatingRemainder(dividingBy: kScreenW)
//            let index = (contentOffsetX / kScreenW).rounded(.towardZero)
//            if screenScale > kScreenW/2 { //大于半屏
//                if scrollDirection.x < 0 {
//                    setupBottomSliderViewX(tagetButton: titleButtons[Int(index) + 1])
//                } else {
//                    setupBottomSliderViewX(tagetButton: titleButtons[Int(index)])
//                }
//            }
//        }
    }
}

extension FZHPageScrollView:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        let vc = childVCs[indexPath.row]
        vc.view.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        cell.addSubview(vc.view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row >= titleButtons.count { return }
        setupBottomSliderViewX(tagetButton: titleButtons[indexPath.row])
    }
    
}

