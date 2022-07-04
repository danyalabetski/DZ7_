//
//  ViewController.swift
//  test
//
//  Created by Даниэл Лабецкий on 30.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewArray: [UIView] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Screen", style: .plain, target: self, action: #selector(theNextScren))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        view.backgroundColor = .gray.withAlphaComponent(0.3)
        
        let circleView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        
        
        viewArray.append(circleView)
    }
    
    @objc
    func didTap(_ gesture: UITapGestureRecognizer) {
        for (index, circle) in viewArray.enumerated() {
            let location = gesture.location(in: circle)
            
            if (location.x > 0 && location.x < 100 ) && (location.y > 0 && location.y < 100) {
                circle.removeFromSuperview()
                viewArray.remove(at: index)
                return
            }
        }
        
        let point = gesture.location(in: view)
        let circleView = UIView(frame: CGRect(x: point.x - 50, y: point.y - 50, width: 100, height: 100))
        
        circleView.backgroundColor = .yellow
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        
        viewArray.append(circleView)
        view.addSubview(circleView)
        
    }
    
    @objc func theNextScren() {
        let vc2 = MoveCircleViewController()
        navigationController?.pushViewController(vc2, animated: true)
    }
}

