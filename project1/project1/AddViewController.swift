//
//  AddViewController.swift
//  Table
//
//  Created by 조주혁 on 2020/06/09.
//  Copyright © 2020 Ju-Hyuk Cho. All rights reserved.
//

import UIKit
import Firebase

var items: [String] = []
var startDate: [String] = []

var price: [String] = []
var dDay: [String] = []
var datesArray: [String] = []
var dDayCount: Int = -1

var ref: DatabaseReference!

class AddViewController: UIViewController{
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textStartDate: UITextField!
    @IBOutlet var textFinishDate: UITextField!
    @IBOutlet var textPrice: UITextField!
    
    let uid: String = (Auth.auth().currentUser?.uid)!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFirstDatePicker()
        createSecondDatePicker()

        // Do any additional setup after loading the view.
    }
    
    func createFirstDatePicker() {
        textStartDate.textAlignment = .center

        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneFirstBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneFirstPressed))
    
        toolBar.setItems([doneFirstBtn], animated: true)
       

        textStartDate.inputAccessoryView = toolBar
      
        textStartDate.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func doneFirstPressed() {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           formatter.timeStyle = .none
           formatter.dateFormat = "yyyy. MM. dd."
           formatter.locale = Locale(identifier: "ko")
           textStartDate.text = formatter.string(from: datePicker.date)
           self.view.endEditing(true)
    }
    
    func createSecondDatePicker() {
        
        textFinishDate.textAlignment = .center

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneSecondBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneSecondPressed))
       
        toolBar.setItems([doneSecondBtn], animated: true)
       
        textFinishDate.inputAccessoryView = toolBar
        textStartDate.inputView = datePicker
        textFinishDate.inputView = datePicker

        datePicker.datePickerMode = .date
    }

    @objc func doneSecondPressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy. MM. dd."
        formatter.locale = Locale(identifier: "ko")
        textFinishDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func btnAddDone(_ sender: Any) {
        ref = Database.database().reference()
        
        let uidRef = ref.child(uid).child(textName.text!)
        
        let startRef = uidRef.child("start")
        startRef.setValue(textStartDate.text)
        let finishRef = uidRef.child("finish")
        finishRef.setValue(textFinishDate.text)
        let priceRef = uidRef.child("price")
        priceRef.setValue(textPrice.text)
        
        textName.text = ""
        textStartDate.text = ""
        textFinishDate.text = ""
        textPrice.text = ""
        
        _ = navigationController?.popViewController(animated: true)
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
