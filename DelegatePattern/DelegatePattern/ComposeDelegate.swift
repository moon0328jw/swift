//
//  ComposeDelegate.swift
//  DelegatePattern
//
//  Created by 문주원 on 2021/04/19.
//

import UIKit

protocol ComposeDelegate {
    func composer(_ vc: UIViewController, didInput value: String?)
    func composerDidCancel(_ vc: UIViewController)
    
}
