//
//  ViewController.swift
//  CustomUI6
//
//  Created by Богдан Бакун on 24.05.2023.
//

import UIKit

class ViewController: UIViewController, MenuBlockDelegate {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var customView1: MenuBlockView!
    @IBOutlet weak var customView2: MenuBlockView!
    @IBOutlet weak var customView3: MenuBlockView!
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView1.delegate = self
        customView2.delegate = self
        customView3.delegate = self
        
        applyGradient()
        applyCornerRadiusAndClipsToBounds()
        configMenuBlockViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = topView.bounds
    }
}

extension ViewController {
    
    private func applyGradient() {
        
        guard
            let color1 = UIColor(hex: "#316D65")?.cgColor,
            let color2 = UIColor(hex: "#489A5A")?.cgColor
        else { return }
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = topView.bounds
        
        topView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func applyCornerRadiusAndClipsToBounds() {
        
        customView1.layer.cornerRadius = 10
        customView1.clipsToBounds = true
        customView2.layer.cornerRadius = 10
        customView2.clipsToBounds = true
        customView3.layer.cornerRadius = 10
        customView3.clipsToBounds = true
    }
    
    private func configMenuBlockViews() {
        
        guard
            let image1 = UIImage(named: "iconMono1"),
            let image2 = UIImage(named: "iconMono2"),
            let image3 = UIImage(named: "iconMono3")
        else { return }
        
        customView1.configure(with: "Рассрочка на карту", image: image1)
        customView2.configure(with: "Покупка\nЧастями", image: image2)
        customView3.configure(with: "Архив", image: image3)
    }
    
    // MARK: Task 8
    func menuElementPressed(element: MenuBlockView) {
        if element == customView1 {
            print("Рассрочка на карту")
        } else if element == customView2 {
            print("Покупка Частями")
        } else if element == customView3 {
            print("Архив")
        }
    }
}
