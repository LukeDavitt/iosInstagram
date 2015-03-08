//
//  TableViewController.swift
//  Instagram
//
//  Created by Luke Davitt on 3/8/15.
//  Copyright (c) 2015 Luke Davitt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITableViewDelegate {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "Users")
        
        //var toDo = toDos[indexPath.row]
        cell.textLabel?.text = "test"
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            //toDos.removeAtIndex(indexPath.row)
            //NSUserDefaults.standardUserDefaults().setObject(toDos, forKey:"toDos")
            //list.reloadData()
        }
    }

}
