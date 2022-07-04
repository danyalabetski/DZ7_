//
//  MoveCircleViewController.swift
//  test
//
//  Created by Даниэл Лабецкий on 1.07.22.
//

import UIKit

class MoveCircleViewController: UIViewController {
    
    let viewCircle: UIView = {
        let view = UIView()
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = view.frame.width / 2
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(viewCircle)
        viewCircle.center = view.center
        
        let gestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(moveRigthCircle(_:)))
        gestureRecognizerRight.direction = .right
        viewCircle.addGestureRecognizer(gestureRecognizerRight)
        
        let gestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveLeftCircle(_:)))
        gestureRecognizerLeft.direction = .left
        viewCircle.addGestureRecognizer(gestureRecognizerLeft)
        
        let gestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(moveUpCircle(_:)))
        gestureRecognizerUp.direction = .up
        viewCircle.addGestureRecognizer(gestureRecognizerUp)
        
        let gestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(moveDownCircle(_:)))
        gestureRecognizerDown.direction = .down
        viewCircle.addGestureRecognizer(gestureRecognizerDown)
    }
    
    @objc func moveRigthCircle(_ gesture: UITapGestureRecognizer) {
        let viewThatFiredGesture = gesture.view
        let mainViewControllet = self.view
            
        if let view = viewThatFiredGesture {
            view.center = CGPoint(x: view.center.x + 20, y: view.center.y)
        }
    }
    
    @objc func moveLeftCircle(_ gesture: UITapGestureRecognizer) {
        let viewThatFiredGesture = gesture.view
            
        if let view = viewThatFiredGesture {
            view.center = CGPoint(x: view.center.x - 20, y: view.center.y)
        }
    }
    
    @objc func moveUpCircle(_ gesture: UITapGestureRecognizer) {
        let viewThatFiredGesture = gesture.view
            
        if let view = viewThatFiredGesture {
            view.center = CGPoint(x: view.center.x, y: view.center.y - 20)
        }
    }
    
    @objc func moveDownCircle(_ gesture: UITapGestureRecognizer) {
        let viewThatFiredGesture = gesture.view
            
        if let view = viewThatFiredGesture {
            view.center = CGPoint(x: view.center.x, y: view.center.y + 20)
        }
    }
}
