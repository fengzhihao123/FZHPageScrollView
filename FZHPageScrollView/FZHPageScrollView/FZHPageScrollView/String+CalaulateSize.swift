//
//  String+CalaulateSize.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/6.
//  Copyright © 2018 冯志浩. All rights reserved.
//  根据文字计算宽度

import Foundation
import UIKit

extension String {
    /**
     function description.
     
     - Parameter font: string's font
     
     - Returns: return string's width.
     */
    func calculateStringWidth(font: UIFont, height: CGFloat) -> CGFloat {
         let size = CGSize(width: .greatestFiniteMagnitude, height: height)
         let rec = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
         return rec.size.width
    }
}
