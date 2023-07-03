//
//  ViewController.swift
//  pinok_1
//
//  Created by Анна on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var shadowView: UIView = {
           let view = UIView()
           view.layer.shadowRadius = 8
           view.layer.shadowOffset = CGSize(width: 3, height: 3)
           view.layer.shadowOpacity = 0.5
           view.layer.cornerRadius = 20
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

       var colorView: UIView = {
           let view = UIView()
           let gradient = CAGradientLayer()
           gradient.colors = [UIColor.green.cgColor, UIColor.systemPink.cgColor]
           gradient.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
           gradient.apply()
           
           view.layer.insertSublayer(gradient, at: 0)
           view.layer.cornerRadius = 20
           view.layer.masksToBounds = true
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setupView()
       }
       
       func setupView() {
           view.backgroundColor = .white
           view.addSubview(shadowView)
           shadowView.addSubview(colorView)
           
           NSLayoutConstraint.activate([
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            shadowView.heightAnchor.constraint(equalToConstant: 100),
            shadowView.widthAnchor.constraint(equalToConstant: 100),
               
            colorView.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
            colorView.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            colorView.heightAnchor.constraint(equalTo: shadowView.heightAnchor),
            colorView.widthAnchor.constraint(equalTo: shadowView.widthAnchor)
        ])
       }
}


public extension CAGradientLayer {
    func apply() {
        let x: Double! = 45 / 360.0
               let a = pow(sinf(Float(2.0 * Double.pi * ((x + 0.75) / 2.0))),2.0);
               let b = pow(sinf(Float(2*Double.pi*((x+0.0)/2))),2);
               let c = pow(sinf(Float(2*Double.pi*((x+0.25)/2))),2);
               let d = pow(sinf(Float(2*Double.pi*((x+0.5)/2))),2);
               
               endPoint = CGPoint(x: CGFloat(c),y: CGFloat(d))
               startPoint = CGPoint(x: CGFloat(a),y:CGFloat(b))
    }
}
