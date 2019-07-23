//
//  ViewController.swift
//  FamilyDemo
//
//  Created by zzk on 2019/7/16.
//  Copyright © 2019 zzk. All rights reserved.
//

import UIKit
import Family

class ViewController: FamilyViewController {
    
    let vc1 = WithTableViewInsideViewController(itemCount: 10)
    let vc2 = WithCollectionViewInsideViewController(itemCount: 50)
    let vc3 = WithCollectionViewInsideViewController(itemCount: 50)
    
    let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    let secondView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.backgroundColor = .red
        secondView.backgroundColor = .blue
        
        addView(firstView)
        addChild(self.vc1, view: { $0.tableView })
        addView(secondView)
        addChild(self.vc2, view: { $0.collectionView })
        addChild(self.vc3, view: { $0.collectionView })
        
        view.backgroundColor = .darkGray
    }


}

