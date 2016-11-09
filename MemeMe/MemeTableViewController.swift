//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Mohammad Awwad on 8/20/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class MemeTableViewController : UITableViewController {
    
    var memes : [Meme]!
    var EditBool : Bool!
    @IBOutlet weak var newMeme: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        EditBool = false
        tableView.setEditing(EditBool, animated: true)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.remove(at: indexPath.row)
        memes.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for : indexPath)
        let meme = memes[indexPath.row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topT! + " " + meme.bottomT!
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    @IBAction func editMeme(_ sender: AnyObject) {
        EditBool = !EditBool
        tableView.setEditing(EditBool, animated: true)
    }
    
    @IBAction func createMeme(_ sender: AnyObject) {
        
        let EditorController = storyboard!.instantiateViewController(withIdentifier: "MemeEditor") as! MemeEditorViewConroller
        present(EditorController, animated: true, completion: nil)
    }
}
