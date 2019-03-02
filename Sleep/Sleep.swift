//
//  Sleep.swift
//  Sleep
//
//  Created by 紫安絵理 on 2019/03/02.
//  Copyright © 2019 紫安絵理. All rights reserved.
//

import Foundation
import RealmSwift

class Sleep: Object {
    //保存するもの
    @objc dynamic var date = ""
    @objc dynamic var quality = ""
    @objc dynamic var time = ""
    @objc dynamic var medicine = ""
    @objc dynamic var activity = ""
    @objc dynamic var food = ""
    
    //ここに追加
    
    override static func primaryKey() -> String {
        return "date"
    }
}
