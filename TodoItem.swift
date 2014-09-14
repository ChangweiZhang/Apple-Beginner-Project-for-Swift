//
//  TodoItem.swift
//  testSwiftProject0
//
//  Created by 张昌伟 on 14/9/12.
//  Copyright (c) 2014年 9Studio. All rights reserved.
//

import UIKit

class TodoItem: NSObject {
    var itemName:NSString!
    var completed:Bool!
    var creationDate:NSDate!
    var completeDate:NSDate!
       func makeAsCompleted()
   {
    self.completed=true
    self.setCompleteDate()
    }
    func setCompleteDate()
    {
    
    }
}
