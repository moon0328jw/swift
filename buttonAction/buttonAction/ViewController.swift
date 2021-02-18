//
//  ViewController.swift
//  buttonAction
//
//  Created by 문주원 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var num: UILabel!
    var currentNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        num.text = String(currentNumber)
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender: Any) {
        currentNumber = currentNumber + 1
        num.text = String(currentNumber)
    }
    
}

