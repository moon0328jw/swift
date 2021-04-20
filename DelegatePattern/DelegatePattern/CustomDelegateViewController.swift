//
//  CustomDelegateViewController.swift
//  DelegatePattern
//
//  Created by 문주원 on 2021/04/14.
//

import UIKit

class CustomDelegateViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController {
            vc.delegate = self
        }
    }
    @objc func presentComposeVC() {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

extension CustomDelegateViewController: ComposeDelegate {
    func composer(_ vc: UIViewController, didInput value: String?) {
        valueLabel.text = value
    }
    
    func composerDidCancel(_ vc: UIViewController) {
        valueLabel.text = "Cancel"
    }
    
    
}
