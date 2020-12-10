//
//  ProfileViewController.swift
//  gsmHungry
//
//  Created by 문주원 on 2020/12/01.
//

import UIKit
import Alamofire
import SideMenu

class ProfileViewController: UITableViewController {
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        tableView.isScrollEnabled = false
        
        menu = SideMenuNavigationController(rootViewController: SideMenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func appTapMenu(_ sender: Any) {
        present(menu!, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        return cell
    }
}


