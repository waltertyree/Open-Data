//
//  ListViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/17/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

protocol Listable : class {
    func itemTitle() -> String
    
}

class ListViewController: UIViewController {
    
    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationDelegate.listForTableView.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let reusedCell = tableView.dequeueReusableCellWithIdentifier("cell") {
            let item = applicationDelegate.listForTableView[indexPath.row]
                reusedCell.textLabel?.text = item.itemTitle()
            return reusedCell
        }
        let cell = UITableViewCell()
        let item = applicationDelegate.listForTableView[indexPath.row]
            cell.textLabel?.text = item.itemTitle()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = applicationDelegate.listForTableView[indexPath.row]
        
    }
}

