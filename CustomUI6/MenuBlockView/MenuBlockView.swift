//
//  MenuBlockView.swift
//  CustomUI6
//
//  Created by Богдан Бакун on 25.05.2023.
//

import UIKit

class MenuBlockView: UIView {
    
    @IBOutlet var menuBlockView: UIView!
    @IBOutlet weak var menuBlockImage: UIImageView!
    @IBOutlet weak var menuBlockLabel: UILabel!
    
    weak var delegate: MenuBlockDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        guard
            let nibView = Bundle.main.loadNibNamed("MenuBlockView", owner: self, options: nil)?.first as? UIView
        else { return }
        
        menuBlockView = nibView
        menuBlockView.fixInView(self)
        setupGesture()
    }
    
    func configure(with text: String, image: UIImage) {
        menuBlockLabel.text = text
        menuBlockImage.image = image
    }
    
    @objc private func handleTap() {
        delegate?.menuElementPressed(element: self)
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
}
