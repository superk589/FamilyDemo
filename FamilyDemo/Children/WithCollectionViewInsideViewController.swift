//
//  WithCollectionViewInsideViewController.swift
//  FamilyDemo
//
//  Created by zzk on 2019/7/16.
//  Copyright © 2019 zzk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class WithCollectionViewInsideViewController: UIViewController {
    
    let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    
    private let disposeBag = DisposeBag()
    
    let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Int>>(configureCell: { (dataSource, collectionView, indexPath, row) -> UICollectionViewCell in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label.text = String(row)
        return cell
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // simulate a network request here
        Observable.just(Array(0..<50))
            .delay(.seconds(2), scheduler: MainScheduler.instance)
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

}

class CollectionViewCell: UICollectionViewCell {
    
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
