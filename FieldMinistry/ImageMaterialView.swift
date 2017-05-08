//
//  MaterialView.swift
//  Techinators-Showcase
//
//  Created by Jonathan Tsistinas on 8/18/16.
//  Copyright © 2016 Techinator. All rights reserved.
//

import UIKit

class ImageMaterialView: UIImageView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 40.0
    }
}
