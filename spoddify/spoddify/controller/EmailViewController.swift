//
//  EmailViewController.swift
//  spoddify
//
//  Created by 문주원 on 2021/03/03.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var emailCheckText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if isValidEmail(testStr: emailText.text!) == false {
            emailCheckText.text = "이 이메일은 유효하지 않습니다. example@email.com과 같은\n형식인지 확인하세요."
            emailText.textColor = UIColor.red
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "birth") as? BirthViewController else {return}
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailTest.evaluate(with: testStr)
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
