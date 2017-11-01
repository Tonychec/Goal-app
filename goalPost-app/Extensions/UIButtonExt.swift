//
//  UIButtonExt.swift
//  goalPost-app
//
//  Created by Nomad on 10/30/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

extension UIButton {
    func setSelectedCilor() {
        self.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8588235294, blue: 0.6862745098, alpha: 1)
    }
}
