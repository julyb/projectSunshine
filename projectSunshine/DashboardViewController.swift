//
//  DashboardViewController.swift
//  projectSunshine
//
//  Created by Daniela Bulgaru on 30/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit

final class DashboardViewController: UIViewController {
    @IBOutlet weak var batteryImageView: UIImageView!
  @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeBattery(_:)), name: NSNotification.Name(rawValue: "level"), object: nil)

    }
    
    func changeBattery(_ notification: NSNotification) {
        
        if let type = notification.userInfo?["type"] as? Type {
            batteryImageView.image = (type == .Green) ? UIImage(named: "battery-high") : UIImage(named: "battery-low")
        }
    }

}

class ManagePageViewController: UIPageViewController {
  var photos = ["boots", "pizz-hut", "pret-a-manger"]
  var currentIndex: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    dataSource = self
    
    // 1
    if let viewController = viewPhotoCommentController(currentIndex ?? 0) {
      let viewControllers = [viewController]
      // 2
      setViewControllers(
        viewControllers,
        direction: .forward,
        animated: false,
        completion: nil
      )
    }
  }
  
  func viewPhotoCommentController(_ index: Int) -> POIViewController? {
    if let storyboard = storyboard,
      let page = storyboard.instantiateViewController(withIdentifier: "POIViewController")
        as? POIViewController {
      page.poiImageViewName = photos[index]
      page.photoIndex = index
      return page
    }
    return nil
  }
}



//MARK: implementation of UIPageViewControllerDataSource
extension ManagePageViewController: UIPageViewControllerDataSource {
  
  // 1
  public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    if let viewController = viewController as? POIViewController {
      var index = viewController.photoIndex
      guard index != NSNotFound && index != 0 else { return nil }
      index = index - 1
      return viewPhotoCommentController(index)
    }
    return nil
  }
  
  // 2
  public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    if let viewController = viewController as? POIViewController {
      var index = viewController.photoIndex
      guard index != NSNotFound else { return nil }
      index = index + 1
      guard index != photos.count else {return nil}
      return viewPhotoCommentController(index)
    }
    return nil
  }
}
