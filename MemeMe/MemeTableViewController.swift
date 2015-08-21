//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Mohammad Awwad on 8/20/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class MemeTableViewController : UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memes : [Meme]!
    var EditBool : Bool!
    @IBOutlet weak var newMeme: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        EditBool = false
        tableView.setEditing(EditBool, animated: true)
        tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.removeAtIndex(indexPath.row)
        memes.removeAtIndex(indexPath.row)
        tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as! UITableViewCell
        let meme = memes[indexPath.row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topT! + " " + meme.bottomT!
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    @IBAction func editMeme(sender: AnyObject) {
        EditBool = !EditBool
        tableView.setEditing(EditBool, animated: true)
    }
    
    @IBAction func createMeme(sender: AnyObject) {
        
        let EditorController = storyboard!.instantiateViewControllerWithIdentifier("MemeEditor") as! MemeEditorViewConroller
        presentViewController(EditorController, animated: true, completion: nil)
    }
}