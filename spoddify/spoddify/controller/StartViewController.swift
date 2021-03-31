//
//  StartViewController.swift
//  spoddify
//
//  Created by 문주원 on 2021/02/18.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoLogin()
        
        naviModify()
        
        labelText()
        
        // Do any additional setup after loading the view.
    }
    func labelText() {
        let titleText: String = "내 마음에 꼭 드는 또 다른\n플레이리스트를\n발견해보세요."
        titleLabel.numberOfLines = 3
        titleLabel.text = titleText
    }
    
    func naviModify() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)

        backBarButtonItem.tintColor = .white

        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func autoLogin() {
        if let email = UserDefaults.standard.string(forKey: "email") {
            if email.isEmpty {
                    print("userDefaults is empty")
                } else {
                    print("userDefaults is not empty, \(email)")
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "naviMain")
                    UIApplication.shared.windows.first?.rootViewController = viewController
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                    navigationController?.popToRootViewController(animated: true)
                }
        } else {
        }
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
