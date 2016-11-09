//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Mohammad Awwad on 8/20/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController : UIViewController {
    
     @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MemeDetailViewController.deleteMeme))
        
    }
    
    func deleteMeme() {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        for index in 0 ..< appDelegate.memes.count {
            if appDelegate.memes[index].memedImage == meme.memedImage {
                appDelegate.memes.remove(at: index)
                if let navigationController = self.navigationController {
                    navigationController.popToRootViewController(animated: true)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
        
        imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    
    
}
