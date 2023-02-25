//
//  ImageViewController.swift
//  CollectionViewHomeWorkApp
//
//  Created by Vlad Lapchynskyi on 23.11.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
    }
}

