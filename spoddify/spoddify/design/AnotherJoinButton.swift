//
//  AnotherJoinButton.swift
//  spoddify
//
//  Created by 문주원 on 2021/02/18.
//

import UIKit

class AnotherJoinButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 24
        self.layer.masksToBounds = true
        self.layer.backgroundColor = CGColor(red: 12/255, green: 12/255, blue: 12/255, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    }

}
