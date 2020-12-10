//
//  DetailViewController.swift
//  Table
//
//  Created by 조주혁 on 2020/06/09.
//  Copyright © 2020 Ju-Hyuk Cho. All rights reserved.
//

import UIKit
import Firebase

var receiveTitle: String = ""

class DetailViewController: UIViewController {
    
    var ref: DatabaseReference!
    var itemName: String = ""
    let uid: String = (Auth.auth().currentUser?.uid)!
    
    @IBOutlet var lblItem: UILabel!
    @IBOutlet var lblStartDate: UILabel!
    @IBOutlet var lblFinishDate: UILabel!
    @IBOutlet var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        receiveItem()
        receiveStartDate()
        receiveFinishDate()
        receivePrice()
    }
    
    func receiveItem() {
        self.lblItem.text = receiveTitle
    }
    
    func receiveStartDate() {
        ref.child(uid).child(receiveTitle).child("start").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? "errorStartDate"
            self.lblStartDate.text = value
        }
    }
    
    func receiveFinishDate() {
        ref.child(uid).child(receiveTitle).child("finish").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? "errorFinishDate"
            self.lblFinishDate.text = value
        }
    }
    
    func receivePrice() {
        ref.child(uid).child(receiveTitle).child("price").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? "errorPrice"
            self.lblPrice.text = value
        }
    }
    
    func receiveTitleText(_ item:String) -> Void {
            receiveTitle = item
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
