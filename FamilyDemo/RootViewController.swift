//
//  RootViewController.swift
//  FamilyDemo
//
//  Created by zzk on 2019/7/23.
//  Copyright © 2019 zzk. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func push(_ sender: UIButton) {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
