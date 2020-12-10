//
//  MemoViewController.swift
//  gsmHungry
//
//  Created by 문주원 on 2020/11/27.
//

import UIKit
import SideMenu


class MemoViewController: UITableViewController {
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: SideMenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func addTapMenu(_ sender: Any) {
        present(menu!, animated: true)
    }
}
