//
//  LoginViewContoller.swift
//  gsmHungry
//
//  Created by 문주원 on 2020/11/27.
//

import UIKit
import Alamofire

class LoginViewContoller: UIViewController {
    
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        alertButton()
    }
    
    func alertButton() {
        let alert = UIAlertController(title: "로그인 성공", message: "로그인을 성공했습니다", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            mainVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            mainVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(mainVC, animated: true)
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: false, completion: nil)
    }
}
