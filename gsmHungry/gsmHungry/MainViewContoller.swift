//
//  MainViewContoller.swift
//  gsmHungry
//
//  Created by 문주원 on 2020/11/30.
//

import UIKit
import SideMenu

class MainViewContoller : UIViewController {
    
    var menu: SideMenuNavigationController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
        
    }
}
