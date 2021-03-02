//
//  JoinNextButton.swift
//  spoddify
//
//  Created by 문주원 on 2021/03/02.
//

import UIKit

class JoinNextButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 24
        self.layer.masksToBounds = true
        self.layer.backgroundColor = CGColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
    }

}
