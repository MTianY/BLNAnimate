//
//  ViewController.swift
//  BLNAnimate
//
//  Created by 马天野 on 2017/2/13.
//  Copyright © 2017年 MTY. All rights reserved.
//  呼吸灯效果

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIImageView!
    
    lazy var outHaloView : UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMidPointView()
        setUpOutHaloView()
        setUpHaloAnimate()
        
    }

}

// MARK: - 呼吸灯动画
extension ViewController {
    
    // 动画中间实心圆点
    fileprivate func setUpMidPointView() {
        
        let midPointView = UIView()
        midPointView.backgroundColor = UIColor.white
        midPointView.bounds.size.width = 8
        midPointView.bounds.size.height = 8
        midPointView.layer.cornerRadius = 4
        midPointView.center = CGPoint(x: 100, y: 100)
        backgroundView.addSubview(midPointView)
    }
    
    // 动画外面光圈
    fileprivate func setUpOutHaloView() {

        outHaloView.backgroundColor = UIColor.white
        outHaloView.bounds.size.width = 40
        outHaloView.bounds.size.height = 40
        outHaloView.layer.cornerRadius = 20
        outHaloView.center = CGPoint(x: 100, y: 100)
        backgroundView.addSubview(outHaloView)
        
    }
    
    // 光圈动画
    fileprivate func setUpHaloAnimate() {
        
        // 缩放动画
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim.fromValue = 0.2
        scaleAnim.duration = 3
        scaleAnim.repeatCount = MAXFLOAT
        
        // 透明度动画
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        opacityAnim.fromValue = 1.0
        opacityAnim.toValue = 0.2
        opacityAnim.duration = 3
        
        // 动画组
        let groupAnim = CAAnimationGroup()
        groupAnim.animations = [scaleAnim, opacityAnim]
        groupAnim.duration = 3
        groupAnim.repeatCount = MAXFLOAT
        groupAnim.isRemovedOnCompletion = false
        groupAnim.fillMode = kCAFillModeForwards
        
        // 将动画添加到layer上
        outHaloView.layer.add(groupAnim, forKey: nil)
        
    }
    
    
    
}
