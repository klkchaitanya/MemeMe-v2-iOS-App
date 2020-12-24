//
//  CollectionViewController.swift
//  MeMe
//
//  Created by Leela Krishna Chaitanya Koravi on 12/23/20.
//  Copyright © 2020 Leela Krishna Chaitanya Koravi. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController:UICollectionViewController{
    
    @IBOutlet var uiCollectionView: UICollectionView!
    var allMemes = Meme.allMemes

    override func viewDidLoad() {
        print("CollectionViewController viewDidLoad")
        //Add New Meme button to UINavigationBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: "launchNewMemeController")
        uiCollectionView.delegate = self
        uiCollectionView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("CollectionViewController viewWillAppear")
        allMemes = Meme.allMemes
        uiCollectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Item number in collection: ",indexPath.row)
        let meme = self.allMemes[indexPath.row]
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.collectionViewMemeImage?.image = meme.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedMeme:Meme = allMemes[indexPath.row]
        print("Did select row at: ", indexPath)
        
        let memeDetailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailController") as! MemeDetailController
        memeDetailController.meme = selectedMeme
        self.navigationController!.pushViewController(memeDetailController, animated: true)
    }
    
    @objc func launchNewMemeController(){
        print("New Meme Controller")
        let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        //newMemeController.modalPresentationStyle = .fullScreen
        self.navigationController!.pushViewController(newMemeController, animated: true)
    }
    
    
}
