//
//  MainVC.h
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface MainVC : UITableViewController

@property (strong, nonatomic) NSMutableArray *arrayOfTodos; // Main array of 'Todos'
@property (strong,nonatomic) Todo *toDo;

@end
