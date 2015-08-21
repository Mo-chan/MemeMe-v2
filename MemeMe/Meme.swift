//
//  Meme.swift
//  MemeMe
//
//  Created by Mohammad Awwad on 8/20/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var topT : String?
    var bottomT : String?
    var originalImage : UIImage?
    var memedImage : UIImage?
    
    init(topText: String?, bottomText: String?, originalImage : UIImage?, memedImage: UIImage?){
        topT = topText
        bottomT = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
    
}