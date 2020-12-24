//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Azzam R Alrashed on 13/12/2020.
//

import UIKit

class HomeViewController: UIViewController {
    
    var posts = [#imageLiteral(resourceName: "image3"),#imageLiteral(resourceName: "image5"),#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image4"),#imageLiteral(resourceName: "image6")]
    @IBOutlet weak var FrontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var likeIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setGradientBackground()
    }
    
    
    func setupViews() {
        FrontImage.image = posts[0]
        backImage.image = posts[1]
        
        FrontImage.layer.cornerRadius = 10
        backImage.layer.cornerRadius = 10
    }
    

    func setGradientBackground() {
        let colorTop =  #colorLiteral(red: 0.2274509804, green: 0.5490196078, blue: 0.8352941176, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0, green: 0.8235294118, blue: 1, alpha: 1).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    @IBAction func did2Taps(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.likeIcon.alpha = 1
            self.likeIcon.frame.size.width = 50
            
        } completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                self.likeIcon.alpha = 0
                self.likeIcon.frame.size.width = 30
                
            }
        }

    }
    
    var postIndex = 2
    @IBAction func didSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        
        let originalBackImageSize = backImage.frame.size
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.FrontImage.transform = CGAffineTransform.identity.rotated(by: .pi )
            switch sender.direction {
            case .down:
                self.FrontImage.center  = CGPoint(x: self.view.frame.midX, y: self.view.frame.maxY * 1.5)
            case .up:
                self.FrontImage.center  = CGPoint(x: self.view.frame.midX, y: -self.view.frame.maxY * 1.5)
            case .right:
                self.FrontImage.center  = CGPoint(x: self.view.frame.maxX * 1.5, y: self.view.frame.midY)
            case .left:
                self.FrontImage.center  = CGPoint(x: -self.view.frame.maxX * 1.5, y: self.view.frame.midY)
            default:
                print("error did not get sender direaction")
            }
            self.backImage.frame.size = self.FrontImage.frame.size
            self.backImage.center  = self.view.center
        } completion: { (_) in
            self.FrontImage.transform  = .identity
            self.FrontImage.image = self.backImage.image
            self.FrontImage.center  = self.view.center
            self.backImage.frame.size = originalBackImageSize
            
            if self.postIndex < self.posts.count {
                self.backImage.image = self.posts[self.postIndex]
                self.postIndex += 1
            } else {
                self.backImage.image = nil
            }
        }

        
        
    }
    
    @IBAction func didlongPressGesture(_ sender: UILongPressGestureRecognizer) {
        
        switch sender.state {
        case .began,.changed:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                self.FrontImage.transform = CGAffineTransform.identity.rotated(by: .pi)
            }
        case .ended:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                self.FrontImage.transform = .identity
            }
        default:
            break
        }
    }
    
    @IBAction func didZoomGesture(_ sender: UIPinchGestureRecognizer) {
        let frontImageWidth = FrontImage.frame.width * sender.scale
        
        switch sender.state {
        case .began,.changed:
            if frontImageWidth >= backImage.frame.width && frontImageWidth < 700  {
                FrontImage.transform = FrontImage.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
            sender.scale = 1
        case .ended:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                self.FrontImage.transform = .identity
            }

        default:
            break
        }
        
    }
    
    // TODO: - 1 Connect the IBoutlets
    // navigationView - fingerTrackerView - navigationViewWidthConstraint - navigationImages
    
    
    // TODO: - 2 handle Pan Gesture IBAction
    @IBAction func homeButtonGesture(_ sender: UIPanGestureRecognizer) {
        // 2.1 Track the movement of the users finger by useing the sender's translation value
        
        // 2.2 store the original Center Point of the navigationView
        
        // 2.3 handle the .began and .changed cases of the sender.state
        
            /* 2.3.X
                1- animate the expansion of the navigationView
                2- move the fingerTrackerView with the users finger
                3- set the translation of the sender to CGPoint.zero
                */
        
        
        
        
        // 2.4 handle the .ended cases of the sender.state
            /* 2.4.X
                1- handle the fingerTrackerView intersections
                2- animate the shrinkage of the navigationView
                */
        
    }
}


