//
//  ListViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

protocol Listable : class {
    func itemTitle() -> String
    
}

class ListViewController: UIViewController {
    
    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var detailViewController : DetailViewController?

    @IBOutlet weak var tableView : UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ListViewController.reload), name: Notifications.ARRAYS_RELOADED, object: nil)

        self.title = "Art in Austin"


        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        /**
        applicationDelegate.listForTableView.sortInPlace { (anItem, aSecondItem)-> Bool in
            anItem.itemTitle() < aSecondItem.itemTitle()
        }
         **/
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.detailViewController = segue.destinationViewController as? DetailViewController
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationDelegate.listForTableView.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return nil
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let reusedCell = tableView.dequeueReusableCellWithIdentifier("cell") {
            let item = applicationDelegate.listForTableView[indexPath.row]
            reusedCell.textLabel?.text = item.itemTitle()
            
            return reusedCell
        }
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        let item = applicationDelegate.listForTableView[indexPath.row]
            cell.textLabel?.text = item.itemTitle()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.detailViewController?.artItem = applicationDelegate.listForTableView[indexPath.row] as? ArtEntry
    }
    
}

/**
 var indexedList=Dictionary<String:Array<String>>()
 
 for fieldToIndex in listOfItems {
 let firstLetter=fieldToIndex.substringToIndex(fieldToIndex.startIndex.advancedBy(1)).uppercaseString
 var indexArray=indexedList[firstLetter] ?? Array<String>()
 letterArray.append(fieldToIndex)
 indexedList[firstLetter]=indexArray
 }

 **/

