//
//  AddTodoItemViewController.swift
//  testSwiftProject0
//
//  Created by 张昌伟 on 14/9/14.
//  Copyright (c) 2014年 9Studio. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var todoItem:TodoItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if((sender as UIBarButtonItem!) != self.doneButton){
            return
    }
        if(self.textfield.text != nil){
            self.todoItem=TodoItem()
            self.todoItem.itemName=self.textfield.text
            self.todoItem.completed=false
        }
    
    }
}
