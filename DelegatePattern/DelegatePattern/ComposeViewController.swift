//
//  ComposeViewController.swift
//  DelegatePattern
//
//  Created by 문주원 on 2021/04/19.
//

import UIKit

class ComposeViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: ComposeDelegate?
    
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            isModalInPresentation = true
        }
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //textField code
        textField.resignFirstResponder()  //if desired
        performDone(self)
        return true
    }
    
    @IBAction func performCancel(_ sender: Any) {
        delegate?.composerDidCancel(self)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func performDone(_ sender: Any) {
        delegate?.composer(self, didInput: inputField.text)
        dismiss(animated: true, completion: nil)
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
