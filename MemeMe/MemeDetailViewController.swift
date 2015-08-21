//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Mohammad Awwad on 8/20/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController : UIViewController{
    
     @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: "deleteMeme")
        
    }
    
    func deleteMeme() {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        for var index = 0; index < appDelegate.memes.count; index++ {
            if appDelegate.memes[index].memedImage == meme.memedImage {
                appDelegate.memes.removeAtIndex(index)
                if let navigationController = self.navigationController {
                    navigationController.popToRootViewControllerAnimated(true)
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.hidden = true
        
        self.imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }

    
    
}