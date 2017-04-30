//
//  POIViewController.swift
//  projectSunshine
//
//  Created by Daniela Bulgaru on 30/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit

final class POIViewController: UIViewController {
  
  @IBOutlet weak var poiImageView: UIImageView!
  {
    didSet {
      guard let image = UIImage(named: poiImageViewName) else {
        return
      }
      poiImageView.image = image
    }
  }
  public var photoIndex: Int = 0
  
  public var poiImageViewName: String = "boots"
  
}
