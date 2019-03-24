//
//  AddTodoVC.h
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainVC.h"

@interface AddTodoVC : UIViewController

/*
 Below is the 'MainVC' instance. It will be populated
 through the prepareForSegue function.
 this allows us to transfer the data between the different view controllers
*/

@property (strong,nonatomic) MainVC *mainVC;

// IBOutlets for interface
@property (weak, nonatomic) IBOutlet UITextField *todoTitleTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
