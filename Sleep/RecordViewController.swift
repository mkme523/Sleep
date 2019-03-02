//
//  RecordViewController.swift
//  Sleep
//
//  Created by 紫安絵理 on 2019/02/16.
//  Copyright © 2019 紫安絵理. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RecordViewController: UIViewController, UITextViewDelegate  {
    //これらをTextViewにかえる
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var qualityTextView: UITextView!
    @IBOutlet var timeTextView: UITextView!
    @IBOutlet var foodTextView: UITextView!
    @IBOutlet var medicineTextView: UITextView!
    @IBOutlet var activityTextView: UITextView!
    
    var date: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        //５こに対応させる
        qualityTextView.delegate = self
        timeTextView.delegate = self
        foodTextView.delegate = self
        medicineTextView.delegate = self
        activityTextView.delegate = self
        
        //枠線
        qualityTextView.layer.borderColor = UIColor.black.cgColor
        timeTextView.layer.borderColor = UIColor.black.cgColor
        foodTextView.layer.borderColor = UIColor.black.cgColor
        medicineTextView.layer.borderColor = UIColor.black.cgColor
       activityTextView.layer.borderColor = UIColor.black.cgColor
        
        qualityTextView.layer.borderWidth = 1.0
         timeTextView.layer.borderWidth = 1.0
         foodTextView.layer.borderWidth = 1.0
         medicineTextView.layer.borderWidth = 1.0
         activityTextView.layer.borderWidth = 1.0
        
        qualityTextView.layer.cornerRadius = 10.0
        qualityTextView.layer.masksToBounds = true
        timeTextView.layer.cornerRadius = 10.0
        timeTextView.layer.masksToBounds = true
        foodTextView.layer.cornerRadius = 10.0
        foodTextView.layer.masksToBounds = true
        medicineTextView.layer.cornerRadius = 10.0
        medicineTextView.layer.masksToBounds = true
        activityTextView.layer.cornerRadius = 10.0
       activityTextView.layer.masksToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dateLabel.text = date
        //ここでRealm（データを保存するときに使うデータベース）を使う。もし日付が一緒だったらその日付のデータを取ってきて表示する
        DispatchQueue(label: "background").async {
            let realm = try! Realm()
            if let savedRecord = realm.objects(Sleep.self).filter("date == '\(self.date!)'").first{
                //5こ
                let quality = savedRecord.quality
                let time = savedRecord.time
                let food = savedRecord.food
                let medicine = savedRecord.medicine
                let activity = savedRecord.activity
                
                DispatchQueue.main.async {
                     self.qualityTextView.text = quality
                     self.timeTextView.text = time
                     self.foodTextView.text = food
                     self.medicineTextView.text = medicine
                     self.activityTextView.text = activity
                    
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //保存ボタンを押した時
    @IBAction func saveButtonPushed(_ sender: UIButton) {
        //Realmに保存する
        let realm = try! Realm()
        
        let sleep = Sleep()
        //かいたものを代入
        sleep.date = date
        
        sleep.quality = qualityTextView.text
        sleep.time = timeTextView.text
        sleep.food = foodTextView.text
        sleep.medicine = medicineTextView.text
        sleep.activity = activityTextView.text
        //書き込み
        try! realm.write {
            realm.add(sleep, update: true)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
}

    
    
   

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


