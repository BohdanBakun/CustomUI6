//
//  CustomUIView.swift
//  CustomUI6
//
//  Created by Богдан Бакун on 24.05.2023.
//

import UIKit

class CustomUIView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    let cornerRadius: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        applyCornerRadius()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomUIView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    private func applyCornerRadius() {
        rightView.layer.cornerRadius = cornerRadius
        rightView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        leftView.layer.cornerRadius = cornerRadius
        leftView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
}
