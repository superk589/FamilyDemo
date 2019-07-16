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
    
    let vc1 = WithCollectionViewInsideViewController()
    let vc2 = WithCollectionViewInsideViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(vc1, view: { $0.collectionView })
        addChild(vc2, view: { $0.collectionView })
        
        view.backgroundColor = .darkGray
    }


}

