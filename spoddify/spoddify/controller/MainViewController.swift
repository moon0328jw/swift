//
//  MainViewController.swift
//  spoddify
//
//  Created by 문주원 on 2021/03/29.
//

import UIKit
import FBSDKLoginKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        if let token = AccessToken.current, !token.isExpired {}
        
        loginButton.permissions = ["public_profile", "email"]
 
        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "pwd")
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "naviLogin")
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
