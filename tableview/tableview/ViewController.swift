//
//  ViewController.swift
//  tableview
//
//  Created by 문주원 on 2020/08/24.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    var list: [String] = ["A", "B", "C", "D", "E"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let text: String = self.list[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }


}

