//
//  PageViewController.swift
//  daimyoSample
//
//  Created by 野澤 通弘 on 2017/12/04.
//  Copyright © 2017年 ikaika software. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    //  各コントローラーのインスタンス生成
    static let speedTestVC = SpeedTestViewController(nibName: "SpeedTestViewController", bundle: nil)
    static let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
    static let historyVC = HistoryViewController(nibName: "HistoryViewController", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
    }
    @IBAction func onSpeedTest(_ sender: Any) {
        self.setViewControllers([getFirst()], direction: .reverse, animated: true, completion: nil)
    }
    @IBAction func onDashBoard(_ sender: Any) {
        if let currentVC = self.viewControllers?.first  {
            
            self.setViewControllers([getSecond()], direction: currentVC is SpeedTestViewController ? .forward : .reverse,  animated: true, completion: nil)
        }
            
        
    }
    @IBAction func onHistory(_ sender: Any) {
        self.setViewControllers([getThird()], direction: .forward, animated: true, completion: nil)
    }
    func getFirst() -> SpeedTestViewController {
        return PageViewController.speedTestVC
    }
    
    func getSecond() -> DashboardViewController {
        return PageViewController.dashboardVC
    }
    
    func getThird() -> HistoryViewController {
        return PageViewController.historyVC
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if viewController is HistoryViewController {
            // 3 -> 2
            return getSecond()
        } else if viewController is DashboardViewController {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is SpeedTestViewController {
            // 1 -> 2
            return getSecond()
        } else if viewController is DashboardViewController {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }

}


