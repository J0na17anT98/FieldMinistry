//
//  RecordViewController.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 10/1/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import PopupDialog

class RecordYearCollectionViewVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    let reuseIdentifier = "yearCell" // also enter this string as the cell identifier in the storyboard
    var items = ["2017"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let yearCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! RecordCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        yearCell.myLabel.text = self.items[indexPath.item]
        //cell.backgroundColor = UIColor.darkGray // make cell more visible in our example project //Added color through storyboard thats why this is commented
        yearCell.layer.borderColor = UIColor.black.cgColor
        yearCell.layer.borderWidth = 2
        yearCell.layer.cornerRadius = 8
        
        return yearCell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}

extension RecordYearCollectionViewVC : UICollectionViewDelegateFlowLayout {
    
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
