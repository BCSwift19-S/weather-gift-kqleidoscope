//
//  PageVC.swift
//  WeatherGift
//
//  Created by Hiroki on 2019/03/10.
//  Copyright © 2019 Hiroki. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    var locationsArray = ["Local City", "Sydney, Australia", "Tokyo, Japan", "Los Angeles, CA"]
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        setViewControllers([createDetailVC(forPage: 0)], direction: .forward, animated: false, completion: nil)

    }
    
    func createDetailVC(forPage page: Int) -> DetailVC {
//Check current page, whether larger than items in locations array
        currentPage = min(max(0, page), locationsArray.count-1)
        
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.locationsArray = locationsArray
        detailVC.currentPage = currentPage
        return detailVC
        
    }


}

extension PageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC {
            if currentViewController.currentPage < locationsArray.count-1 {
                return createDetailVC(forPage: currentViewController.currentPage+1)
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC {
            if currentViewController.currentPage > 0 {
                return createDetailVC(forPage: currentViewController.currentPage-1)
            }
        }
        return nil
    }
    
    
    
}
