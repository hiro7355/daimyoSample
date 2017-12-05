//
//  DataManager.swift
//  daimyoSample
//
//  Created by 野澤 通弘 on 2017/12/05.
//  Copyright © 2017年 ikaika software. All rights reserved.
//
//  realmをカプセル化
//

import Foundation
import RealmSwift

class DataManager: NSObject {
    private let realm  : Realm? = try? Realm()

    static let sharedInstance = DataManager()
    private override init() {}
    
    func add(object: Object) {
        self.realm?.add(object)
    }
    
    func delete(object: Object) {
        self.realm?.delete(object)
    }
    func objects<DataElement: Object>(_ type: DataElement.Type) -> Results<DataElement>? {
        return self.realm?.objects(type)
    }
}
