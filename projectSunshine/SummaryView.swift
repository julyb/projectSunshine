//
//  SummaryView.swift
//  projectSunshine
//
//  Created by Iulia Baltoi on 30/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit
import Foundation


protocol SummaryViewProtocol {
    func didTapCloseButton()
    func didTapDetails()
}

class SummaryView: NibLoadingView {

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var logoLabel: UIImageView!

    var delegate: SummaryViewProtocol?
    
    @IBAction func didClose(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.didTapCloseButton()
    }
    
    @IBAction func didTapMoreDetails(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.didTapDetails()
    }
    
    func configureForType(type: Type) {
        
        if type == .Green {
            
            self.logoLabel.image = UIImage(named: "pin-green")
            
            self.summaryLabel.text = "You just checked in into a green place! Check your dashboard for your energy levels!"
            
        } else if type == .Red {
            self.logoLabel.image = UIImage(named: "pin-red")
            
            self.summaryLabel.text = "You just checked in into a non-green place! Your energy levels are dropping!"
        }
    }
}
