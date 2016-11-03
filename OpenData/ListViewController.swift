//
//  ListViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

protocol Listable {
    func itemTitle() -> String
    
}

class ListViewController: UIViewController {
    
    let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
    var detailViewController : DetailViewController?
    
    @IBOutlet weak var tableView : UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ListViewController.reload), name: NSNotification.Name(rawValue: Notifications.ARRAYS_RELOADED), object: nil)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        /**
         applicationDelegate.listForTableView.sortInPlace { (anItem, aSecondItem)-> Bool in
         anItem.itemTitle() < aSecondItem.itemTitle()
         }
         **/
    }
    
    
    func reload() {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.detailViewController = segue.destination as? DetailViewController
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationDelegate.listForTableView.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let item = applicationDelegate.listForTableView[(indexPath as NSIndexPath).row]
            reusedCell.textLabel?.text = item.itemTitle()
            
            return reusedCell
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let item = applicationDelegate.listForTableView[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = item.itemTitle()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.detailViewController?.tree = applicationDelegate.listForTableView[(indexPath as NSIndexPath).row] as? HeratigeTree
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

