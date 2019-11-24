//
//  WithTableViewInsideViewController.swift
//  FamilyDemo
//
//  Created by zzk on 2019/7/17.
//  Copyright © 2019 zzk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class WithTableViewInsideViewController: UIViewController {
    
    private let itemCount: Int
    
    init(itemCount: Int) {
        self.itemCount = itemCount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = UITableView()
    
    private let disposeBag = DisposeBag()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<Void, Int>>(configureCell: { (dataSource, tableView, indexPath, row) -> UITableViewCell in
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TextViewTableViewCell
        return cell
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "TextViewTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        
        // simulate a network request here
        Observable.just(Array(0..<itemCount))
            .delay(.seconds(2), scheduler: MainScheduler.instance)
            .take(1)
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
    
}

class TableViewCell: UITableViewCell {
    
    
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
        contentView.addSubview(label)
        contentView.backgroundColor = .white
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
