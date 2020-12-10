//
//  ViewController.swift
//  jsonTest
//
//  Created by 문주원 on 2020/10/20.
//

import UIKit

class ViewController: UIViewController {

    var persons = [String: Any]()
    var nameArr = [String]()
    var ageArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "person", ofType: "json")
        
        if let data = try? String(contentsOfFile: path!).data(using: .utf8) {
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            print(json)
            persons = json
        }
        
        if let person = persons["person"] as? [[String: Any]]{
            for personIndex in person {
                nameArr.append(personIndex["name"] as! String)
                ageArr.append(personIndex["age"] as! String)
            }
        }
        
        
        // Do any additional setup after loading the view.
    }


}

