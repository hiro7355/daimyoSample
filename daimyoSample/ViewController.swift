//
//  ViewController.swift
//  daimyoSample
//
//  Created by 野澤 通弘 on 2017/12/01.
//  Copyright © 2017年 ikaika software. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  スクロールビューのデリゲートに自分を設定します。これをしないとスクロールできないみたい。
        self.scrollView.delegate = self

        //  各コントローラーのインスタンス生成
        let speedTestVC = SpeedTestViewController(nibName: "SpeedTestViewController", bundle: nil)
        let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
        let historyVC = HistoryViewController(nibName: "HistoryViewController", bundle: nil)

        //  各コントローラーのビューをメインのスクロールビューに追加
        self.addScrollSubView(subView: speedTestVC.view!)
        self.addScrollSubView(subView: dashboardVC.view!)
        self.addScrollSubView(subView: historyVC.view!)

        
        
    }
    
    private func addScrollSubView(subView newView: UIView) {
        let stackView = self.stackView!
        let scrollView = self.scrollView!
        
        stackView.addArrangedSubview(newView)
        
        //  スクロールビューと同じ幅の制約を設定します
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0).isActive = true
        //  スクロールさせるには、スタックビューの制約でtop, leading, bottom, trailing のマージン設定を0に設定する必要があります。

    }
    
    //
    //  ページインデックスを指定してスクロールします
    //
    private func scroll(toPageIndex index : Int) {
        //スクロールビューのX座標を更新します
       // self.scrollView.contentOffset.x = self.scrollView.frame.maxX * CGFloat(index)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = self.scrollView.frame.maxX * CGFloat(index)
            }, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onSpeedTest(_ sender: Any) {
        self.scroll(toPageIndex: 0)
    }
    @IBAction func onDashboard(_ sender: Any) {
        self.scroll(toPageIndex: 1)
    }
    @IBAction func onHistory(_ sender: Any) {
        self.scroll(toPageIndex: 2)
    }
    
}

