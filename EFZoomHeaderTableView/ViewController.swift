//
//  ViewController.swift
//  EFZoomHeaderTableView
//
//  Created by Eddie Fu on 10/4/15.
//  Copyright © 2015 Eddie Fu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var zoomHeaderView: EFZoomHeaderTableView!
    let tableHeaderHeight:CGFloat = 205.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        tableView = UITableView(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height))
        tableView.backgroundColor = UIColor.clearColor()
        tableView.delegate = self
        tableView.dataSource = self
        zoomHeaderView = EFZoomHeaderTableView(frame: CGRectMake(0, 0, self.view.frame.size.width, tableHeaderHeight), backgroundImage: UIImage(named:"background")!)
        zoomHeaderView.scrollView = tableView;
        view .addSubview(tableView)
        view .addSubview(zoomHeaderView)
    }
    
    /// Mark: UITableView Data Source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        cell!.textLabel!.text = "Cell \(indexPath.row)"
        return cell!
    }
}

