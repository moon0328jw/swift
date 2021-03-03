//
//  BirthViewController.swift
//  spoddify
//
//  Created by 문주원 on 2021/03/02.
//

import UIKit

class BirthViewController: UIViewController {

    @IBOutlet weak var birthTextField: UITextField!
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    
    func createDatePicker() {
        //format for picker
        birthTextField.textAlignment = .center
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
            
        birthTextField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        //assigning date picker to text field
        birthTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko")
    }
    @objc func donePressed(sender: UIButton) {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy년 mm월 dd일"
        birthTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
