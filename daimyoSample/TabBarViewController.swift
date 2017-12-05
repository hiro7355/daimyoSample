//
//  TabBarViewController.swift
//  daimyoSample
//
//  Created by 野澤 通弘 on 2017/12/05.
//  Copyright © 2017年 ikaika software. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  各コントローラーのインスタンス生成
        let speedTestVC = SpeedTestViewController(nibName: "SpeedTestViewController", bundle: nil)
        let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
        let historyVC = HistoryViewController(nibName: "HistoryViewController", bundle: nil)

        //表示するtabItemを指定（今回はデフォルトのItemを使用）
        speedTestVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)
        dashboardVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 2)
        historyVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 3)

        
        // 配列をTabにセットします。
        self.setViewControllers([speedTestVC,dashboardVC,historyVC], animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
