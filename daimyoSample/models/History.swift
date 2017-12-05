//
//  History.swift
//  daimyoSample
//
//  Created by 野澤 通弘 on 2017/12/05.
//  Copyright © 2017年 ikaika software. All rights reserved.
//

import Foundation
import RealmSwift


class History : Object  {

    @objc dynamic var id : Int = 0                      //  ID
    @objc dynamic var wifi : String = ""                //  Wifi
    @objc dynamic var downloadDataUsedMB : Double = 0   //  Download data used（単位MB）
    @objc dynamic var uploadDataUsedMB : Double = 0     //  Upload data used（単位MB）
    @objc dynamic var latitude: Double = 0              //  緯度
    @objc dynamic var longitude: Double = 0             //  経度
    @objc dynamic var externalIP : String = ""          //
    @objc dynamic var internalIP : String = ""          //
//
//
    static var nextId : Int = 1                         //  次の履歴のid
    static var histories : [History] = []               //  履歴一覧

    //　MARK: プライマリーキーの設定
    //  Realmにidがプライマリーキーであることを通知します
    override static func primaryKey() -> String? {
        return "id"
    }

    // MARK: HistoryオブジェクトをDBに追加
    /**
     HistoryオブジェクトをRealmに追加します
     
     - parameter wifi: Wifi名
     - parameter downloadDataUsedMB: Download data used（単位MB）
     - parameter uploadDataUsedMB: Upload data used（単位MB）
     - parameter latitude: 緯度
     - parameter longitude: 経度
     - parameter externalIP: 外部IPアドレス
     - parameter internalIP: 内部IPアドレス
     
     */
    static func add(wifi: String, downloadDataUsedMB: Double, uploadDataUsedMB: Double, latitude: Double, longitude: Double, externalIP: String, internalIP: String ) {
        
        let object = History()
        
        object.id = History.nextId
        History.nextId = History.nextId + 1 //  次のオブジェクトのためにidカウントアップ
        

        object.wifi = wifi
        object.downloadDataUsedMB = downloadDataUsedMB
        object.uploadDataUsedMB = uploadDataUsedMB
        object.latitude = latitude
        object.longitude = longitude
        object.externalIP = externalIP
        object.internalIP = internalIP
        
        //  realmにレコード追加します
        DataManager.sharedInstance.add(object: object)

    }
    
    
    
    // MARK: 履歴一覧の取得
    /**
     履歴一覧をRealmから取得します
     
     - parameter wifi: Wifi名
     - parameter downloadDataUsedMB: Download data used（単位MB）
     - parameter uploadDataUsedMB: Upload data used（単位MB）
     - parameter latitude: 緯度
     - parameter longitude: 経度
     - parameter externalIP: 外部IPアドレス
     - parameter internalIP: 内部IPアドレス
     
     */
    static func updateObjects() -> [History] {
        
        History.histories.removeAll()
        if let results = DataManager.sharedInstance.objects(History.self) {

            if results.count > 0 {
                if let lastId = results.last?.id {
                    History.nextId = lastId + 1
                }
                
                //  realmから取得した一覧を配列に変換します
                History.histories = results.map{ $0 }
            }
        }
        
        
        return History.histories
    }
}
