//
//  LocationEnergyDetailViewController.swift
//  projectSunshine
//
//  Created by Daniela Bulgaru on 30/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit

final class LocationEnergyDetailViewController: UIViewController {
  
  @IBOutlet weak var brandNameLabel: UILabel!
  @IBOutlet weak var brandLogoImageView: UIImageView!
//  @IBOutlet weak var solarPanelImageView: UIImageView!
  
  @IBAction func closeTapped(_ sender: Any) {
    dismiss(animated: true)
  }
  
  let solarPanelInformation = [
    "solar-panel-5" : "Monocrystalline \nMonocrystalline solar panels use thin wafers from single silicon crystals, which have been grown for this exact purpose, as their semiconductor. The fact that they do not mix the silicon gives them a uniform look. It also makes them the most efficient style of solar panel. As a buyer this means that monocrystalline solar panels may be the most expensive, but they will also produce the most electricity.",
    
    "solar-panel-8" : "Thin film / amorphous silicon \nThin film solar panels are a newer technology than crystalline panels. Thin film panels use an incredibly thin layer of amorphous silicon as their semiconductor. This method makes the panels overall thinner and more aesthetically pleasing. Thin film panels can be more flexible and more easily mounted onto a variety of surfaces.",
    
    "solar-panel-4" : "Hybrid \nThere is a new type of hybrid solar panel making it’s way slowly onto the mainstream market. Hybrid panels are essentially PV panels with heat exchangers underneath which syphon off any excess heat created by the panels. Solar panels do not need heat to work, they only need light. However, panels can become hot over the course of the day and too much heat can actually reduce their efficiency. With this in mind, engineers have created a way to use that excess heat to create hot water for the household to use.",
    
//    "solar-panel-5" : "",
//    "solar-panel-6" : "",
//    "solar-panel-7" : "",
//    "solar-panel-8" : "",
    
    "solar-panel-6" : "Polycrystalline \nPolycrystalline panels use off cuts of different silicon crystals, melted down into a mould, to form their semiconductor. This disjointed nature makes them slightly less efficient than monocrystalline panels. However, the difference in the efficiency of mono/polycrystalline panels used to be more noticeable than it is now. Developments in crystalline technology have lead to monocrystalline and polycrystalline solar systems having a very similar price and output. One of the only real differences left is their look. Polycrystalline panels seem to have a bluer look due to the various crystal pieces reflecting the light.",
  ]
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
//    solarPanelInformation.keys.forEach { key in
//      solarPanelImageView.image = UIImage(named: key)
//      solarPanelDetailsLabel.text = solarPanelInformation[key]
//    }
  }
  
}
