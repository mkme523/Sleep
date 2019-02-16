//
//  RecordViewController.swift
//  Sleep
//
//  Created by 紫安絵理 on 2019/02/16.
//  Copyright © 2019 紫安絵理. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet var monthTextView: UITextView!
    @IBOutlet var dateTextView: UITextView!
    @IBOutlet var qualityTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var foodTextField: UITextField!
    @IBOutlet var medicineTextField: UITextField!
    @IBOutlet var memoTextField: UITextField!
    
    let date = Date()
    let formatter = DateFormatter()
    let saveData: UserDefaults = UserDefaults.standard
    let calendar = Calendar.current

    override func viewDidLoad() {
        super.viewDidLoad()
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        monthTextView.text = String(month)
        dateTextView.text = String(day)
        
        formatter.timeStyle = .none
        formatter.dateStyle = .full
        var dateKey:String = formatter.string(from: date)
        print(dateKey)
        
//        saveData.set(qualityTextField.text forkey:"")

        
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
