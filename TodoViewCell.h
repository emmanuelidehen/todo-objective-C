//
//  TodoViewCell.h
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface TodoViewCell : UITableViewCell

// Todo object for each cell
@property (strong, nonatomic) Todo *todo;

// Function to return the color that represnts the status of the 'Todo'
- (UIColor *)returnColorFromCompetionStatus:(TodoStatus)status;

// IBOutlets fot cell
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoDeadlineLabel;
@property (weak, nonatomic) IBOutlet UIView *statusbarView;

@end
