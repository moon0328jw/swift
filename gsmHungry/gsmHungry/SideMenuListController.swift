//
//  SideMenuListController.swift
//  gsmHungry
//
//  Created by 문주원 on 2020/12/01.
//

import UIKit
import SideMenu

class SideMenuListController: UITableViewController {
    
    var items = ["Home", "Profile", "Log out"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
            case 0:
                guard let pvc = self.presentingViewController else { return }
                self.dismiss(animated: false) {
                    pvc.dismiss(animated: false, completion: nil)
                    guard let pvcpvc = pvc.presentingViewController else { return }
                    pvcpvc.dismiss(animated: false, completion: nil)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                    mainVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                    mainVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    pvcpvc.present(mainVC, animated: false)
                }
            case 1:
                guard let pvc = self.presentingViewController else { return }
                self.dismiss(animated: false) {
                    pvc.dismiss(animated: false, completion: nil)
                    guard let pvcpvc = pvc.presentingViewController else { return }
                    pvcpvc.dismiss(animated: false, completion: nil)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
                    profileVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                    profileVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    pvcpvc.present(profileVC, animated: false)
                }
            case 2:
                guard let pvc = self.presentingViewController else { return }
                self.dismiss(animated: false) {
                    pvc.dismiss(animated: true, completion: nil)
                }
            default:
                break
        }
    }
}
