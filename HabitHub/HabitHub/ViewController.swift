//
//  ViewController.swift
//  HabitHub
//
//  Created by Laura Castro on 2/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "100oz Water"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 50, startAngle: -(.pi/2), endAngle: .pi * 2, clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 8
        trackShape.strokeColor = UIColor.white.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 8
        shape.strokeColor = UIColor.green.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)

        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-70, width: view.frame.size.height-40, height: 50))
        view.addSubview(button)
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton() {
        //animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }

}

