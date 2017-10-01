//
//  RecordMonthCollectionViewVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 10/1/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import PopupDialog

class RecordMonthCollectionViewVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    let reuseIdentifier = "monthCell" // also enter this string as the cell identifier in the storyboard
    var items = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let monthCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! RecordCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        monthCell.myLabel.text = self.items[indexPath.item]
        //cell.backgroundColor = UIColor.darkGray // make cell more visible in our example project //Added color through storyboard thats why this is commented
        monthCell.layer.borderColor = UIColor.black.cgColor
        monthCell.layer.borderWidth = 2
        monthCell.layer.cornerRadius = 8
        
        return monthCell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}

extension RecordMonthCollectionViewVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}
