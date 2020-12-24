//
//  MemeDetailController.swift
//  MeMe
//
//  Created by Leela Krishna Chaitanya Koravi on 12/23/20.
//  Copyright © 2020 Leela Krishna Chaitanya Koravi. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailController:UIViewController {
    
    var meme:Meme!
    @IBOutlet weak var memeDetailImage: UIImageView!
    
    override func viewDidLoad() {
        print("MemeDetailController viewDidLoad")
        memeDetailImage?.image = meme.memedImage
    }
}
