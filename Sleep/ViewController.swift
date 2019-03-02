//
//  ViewController.swift
//  Sleep
//
//  Created by 紫安絵理 on 2019/02/16.
//  Copyright © 2019 紫安絵理. All rights reserved.
//

import UIKit
//import Realm
import RealmSwift
import JBDatePicker


class ViewController: UIViewController, JBDatePickerViewDelegate  {
    @IBOutlet weak var datePicker: JBDatePickerView!
//    @IBOutlet weak var monthPicker: JBDatePickerMonthView!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var monthLabel: UILabel!

    var date: String!
    let month = Date()
    var calender = Calendar.current
    let dateformatter2 = DateFormatter()
    
    var colorForDayLabelInMonth: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    var colorForDayLabelOutOfMonth: UIColor {
        return UIColor (hex: "00000")
        
    }
    var colorForWeekDaysViewBackground: UIColor {
        return UIColor(hex: "FFFFFF")

    }
    var colorForSelectionCircleForToday: UIColor {
        return UIColor (hex: "FCFFD9") }
  
    var colorForSelelectedDayLabel: UIColor {
        return UIColor (hex: "000000")}
    var colorForWeekDaysViewText: UIColor {
        return UIColor (hex: "000000") }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.delegate = self
        dateformatter2.dateFormat = "LLLL"
        let monthName = dateformatter2.string(from: month)
        monthLabel.text = String(monthName)
        
    }
    
    //日付を押した時
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("date selected: \(String(describing: dayView.date))")
        date = dateFormatter.string(from: dayView.date!)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        datePicker.updateLayout()
    }
    
    //画面を遷移する
    @IBAction func writeButtonPushed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toRecord", sender: nil)
    }
    
    //画面を遷移するときに値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toRecord") {
            let recordView = segue.destination as! RecordViewController
            recordView.date = self.date
        }
    }
    //日付の表示の仕方
    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        //yyyyが年MMが月ddが日にち。これを自分の表示したいように
        formatter.dateFormat = "yyyy    MM/dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter
    }()
    




}

