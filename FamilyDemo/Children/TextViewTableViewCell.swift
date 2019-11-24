//
//  TextViewTableViewCell.swift
//  FamilyDemo
//
//  Created by zzk on 11/24/19.
//  Copyright © 2019 zzk. All rights reserved.
//

import UIKit
import Then
import RxGesture
import RxSwift
import RxCocoa

class TextViewTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        textView.do {
            $0.isEditable = false
            $0.isSelectable = true
            $0.isScrollEnabled = false
            // remove padding to make it look like a label
            $0.textContainerInset = .zero
            $0.textContainer.lineFragmentPadding = 0
            if #available(iOS 11.0, *) {
                $0.textDragInteraction?.isEnabled = false
            }
        }
        
        rx
            .longPressGesture(configuration: { (gesture, delegate) in
                delegate.selfFailureRequirementPolicy = .custom({ (gesture, other) -> Bool in
                    return other is UILongPressGestureRecognizer
                })
            })
            .when(.began)
            .subscribe(onNext: { [unowned self] gesture in
                self.textView.becomeFirstResponder()
                self.textView.selectAll(self)
            })
            .disposed(by: disposeBag)
    }
    
}
