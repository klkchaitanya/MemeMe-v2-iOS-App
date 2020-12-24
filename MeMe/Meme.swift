//
//  Meme.swift
//  MeMe
//
//  Created by Leela Krishna Chaitanya Koravi on 12/22/20.
//  Copyright © 2020 Leela Krishna Chaitanya Koravi. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var topText1:String
    var bottomText1:String
    var originalImage = UIImage()
    var memedImage = UIImage()
}

extension Meme {
    
    static var allMemes: [Meme] {
        
        var memeArray = [Meme]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memeArray = appDelegate.memes
        print("Meme array size: ", memeArray.count)
        return memeArray
}

}
