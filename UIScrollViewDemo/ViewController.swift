//
//  ViewController.swift
//  UIScrollViewDemo
//
//  Created by Chhaileng Peng on 7/15/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var mySrollView: UIScrollView?
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        mySrollView?.backgroundColor = UIColor.black
        
        self.view.addSubview(mySrollView!)
        mySrollView?.showsVerticalScrollIndicator = false
        mySrollView?.showsHorizontalScrollIndicator = false
        mySrollView?.delegate = self
        
        imageView = UIImageView(image: UIImage(named: "wallpaper"))
        mySrollView?.contentSize = CGSize(width: (imageView?.frame.width)!, height: (imageView?.frame.height)!)
        mySrollView?.addSubview(imageView!)
        
        mySrollView?.maximumZoomScale = 10
        mySrollView?.minimumZoomScale = 0
        mySrollView?.zoomScale = 0.1
        
        // Set gesture double tap to zoom image
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(zoomImage))
        doubleTap.numberOfTapsRequired = 2
        imageView?.isUserInteractionEnabled = true
        imageView?.addGestureRecognizer(doubleTap)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @objc func zoomImage() {
        if Double((mySrollView?.zoomScale)!) < 0.5 {
            UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                self.mySrollView?.setZoomScale(0.5, animated: false)
            })
        } else if Double((mySrollView?.zoomScale)!) == 0.5 {
            UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
                self.mySrollView?.setZoomScale(0.1, animated: false)
            })
        }
    }


}












