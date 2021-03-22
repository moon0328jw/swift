//
//  PwdViewController.swift
//  spoddify
//
//  Created by 문주원 on 2021/03/18.
//

import UIKit

class PwdViewController: UIViewController {

    @IBOutlet weak var pwdText: UITextField!
    @IBOutlet weak var pwdCheckText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if isValidPwd(testStr: pwdText.text!) == false {
            pwdCheckText.text = "이 비밀번호는 유효하지 않습니다. 숫자,문자를 포함해서 8~20글자 사이인지 확인하세요."
            pwdText.textColor = UIColor.red
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "birth") as? BirthViewController else {return}
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func isValidPwd(testStr:String) -> Bool {
          let pwdRegEx = "(?=.*[A-Za-z])(?=.*[0-9]).{8,20}"
          let pwdTest = NSPredicate(format:"SELF MATCHES %@", pwdRegEx)
          return pwdTest.evaluate(with: testStr)
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
