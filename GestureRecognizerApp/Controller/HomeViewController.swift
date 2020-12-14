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
    
}


