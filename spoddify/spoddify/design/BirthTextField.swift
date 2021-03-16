//
//  BirthTextView.swift
//  spoddify
//
//  Created by 문주원 on 2021/03/02.
//

import UIKit

class BirthTextField: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.layer.backgroundColor = CGColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
    }

}
