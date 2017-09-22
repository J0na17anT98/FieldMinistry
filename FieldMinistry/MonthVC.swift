//
//  MonthVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 9/22/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

class MonthVC: UIViewController {
    
    
    @IBOutlet weak var monthScrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth : CGFloat = 0.0
        
        let scrollWidth = monthScrollView.frame.size.width
        
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            monthScrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y: (monthScrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        monthScrollView.clipsToBounds = false
        monthScrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
}


