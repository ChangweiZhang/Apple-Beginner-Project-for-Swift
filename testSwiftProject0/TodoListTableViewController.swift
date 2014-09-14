//
//  TodoListTableViewController.swift
//  testSwiftProject0
//
//  Created by 张昌伟 on 14/9/14.
//  Copyright (c) 2014年 9Studio. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    var todoItems:NSMutableArray!
    
    func loadinitData()
    {
       
        for i in 1...15
        {
            var todoItem=TodoItem()
            todoItem.itemName="Test Case"
            todoItem.completed=false
            todoItems.addObject(todoItem)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoItems=NSMutableArray()
        loadinitData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.todoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoListCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        var todoItem=self.todoItems.objectAtIndex(indexPath.row) as TodoItem
        cell.textLabel?.text=todoItem.itemName
        if(todoItem.completed==true){
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType=UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
/*
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
*/
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var todoItem=self.todoItems.objectAtIndex(indexPath.row) as TodoItem
        if( todoItem.completed==true){
            todoItem.completed=false}
        else{
            todoItem.completed=true}
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        var source=segue.sourceViewController as AddTodoItemViewController
        var item=source.todoItem
        if(item != nil)
        {
            self.todoItems.addObject(item)
            self.tableView.reloadData()
        }
    }

}
