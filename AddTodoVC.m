//
//  AddTodoVC.m
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import "AddTodoVC.h"
#import "Todo.h"
#import "MainVC.h"

@interface AddTodoVC ()

@end

@implementation AddTodoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpDatePicker]; // Sets up the color of the UIDate picker elements to white
    [_todoTitleTextField setDelegate:self]; // This is needed to dissmiss the keyboard
}

// Funtion ta add a 'Todo' Object in the array from MainVC
- (IBAction)addTodo:(id)sender {
    
    // Creates a NSDateFormatter so we can format the date from the date picker
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"M/d/yyyy"];
    NSString *stringDate = [dateFormatter stringFromDate:_datePicker.date];
    
    // Creates new 'Todo' with information from the '_todoTitleTextField' and the data from the 'date picker'
    Todo *newTodo = [[Todo alloc]initWithInformation:_todoTitleTextField.text todoDeadline:stringDate todoStatus:unfinished];
    [_mainVC.arrayOfTodos addObject: newTodo]; // Adds new todo to MainVC's 'arrayOfTodos'
    [_mainVC.tableView reloadData]; // Uodates the data so we can see the new 'Todo' object
    [self.navigationController popViewControllerAnimated:YES]; // Dismisses view when done
}

// Function for returning the text field
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [_todoTitleTextField resignFirstResponder];
    }
}

// Sets up the color of the UIDate picker elements to white
// Cant take credit for this, found it here (insert link here)
-(void)setUpDatePicker{
    [self.datePicker setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
    SEL selector = NSSelectorFromString( @"setHighlightsToday:" );
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                               [UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:self.datePicker];
}

@end
