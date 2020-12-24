//
//  MainViewController.swift
//  MeMe
//
//  Created by Leela Krishna Chaitanya Koravi on 12/22/20.
//  Copyright © 2020 Leela Krishna Chaitanya Koravi. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController{
    
    @IBOutlet var uiTableView: UITableView!
    var allMemes = Meme.allMemes
    
    
    override func viewDidLoad() {
        print("TableViewController View Did Load")
        //Add New Meme button to UINavigationBar
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: "launchNewMemeController")
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        //get all memes saved from delegate
        //allMemes = Meme.allMemes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("TableViewController View Will Appear")
        allMemes = Meme.allMemes
        uiTableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memeCount = self.allMemes.count
        print("Number of rows in selection: ", memeCount)
        return memeCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Memes size: ", self.allMemes.count)
        print("Preparing table cell: ", indexPath)

        // Set the name and image
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let meme = self.allMemes[indexPath.row]
        cell.tableViewMemeImage?.image = meme.originalImage
        cell.tableViewMemeLabel?.text = meme.topText1+" "+meme.bottomText1        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedMeme:Meme = allMemes[(indexPath as NSIndexPath).row]
        print("Did select row at: ", indexPath, " ", selectedMeme.topText1)
        
        let memeDetailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailController") as! MemeDetailController
        memeDetailController.meme = selectedMeme
        self.navigationController!.pushViewController(memeDetailController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    
    @objc func launchNewMemeController(){
        print("New Meme Controller")
        let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        //newMemeController.modalPresentationStyle = .fullScreen
        self.navigationController!.pushViewController(newMemeController, animated: true)
    }
    
    
    
}
