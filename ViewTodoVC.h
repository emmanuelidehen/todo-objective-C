//
//  ViewTodoVC.h
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface ViewTodoVC : UIViewController

// These properties will be populated by the prepareForSegue function
@property (strong,nonatomic) Todo *todo;
@property (strong,nonatomic) UITableView *tableView; // Tableview from 'MainVC'

// IBOutlets for interface
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoDeadlineLabel;
@property (weak, nonatomic) IBOutlet UIButton *todoUnfinishedButton;
@property (weak, nonatomic) IBOutlet UIButton *todoInProgressButton;
@property (weak, nonatomic) IBOutlet UIButton *todoFinishedButton;
@property (weak, nonatomic) IBOutlet UIView *todoUnfinishedUnderlineBar;
@property (weak, nonatomic) IBOutlet UIView *todoInProgressUnderlineBar;
@property (weak, nonatomic) IBOutlet UIView *todoFinishedUnderlineBar;

@end
