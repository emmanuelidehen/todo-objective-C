//
//  ViewTodoVC.m
//  objc_mvc_todo
//
// Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import "ViewTodoVC.h"

@interface ViewTodoVC ()

@end

@implementation ViewTodoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI]; // Sets up UI
}

// Populates views with information from the 'ToDo' object passed in through
// the prepareForSegue function
- (void)setupUI{
    _todoTitleLabel.text = self.todo.todoTitle;
    _todoDeadlineLabel.text = self.todo.todoDeadline;
    [self checkForStatus:_todo.todoStatus]; // Updates the underline of the finishedButtons
}

/*
 The IBActions below chages the finishedState of the 'Todo' and updates views
 Throughout the app accordingly
 */

- (IBAction)unfinishedButtonPressed:(id)sender {
    _todo.todoStatus = unfinished;
    [self checkForStatus:_todo.todoStatus];
    [self.tableView reloadData];
}
- (IBAction)inProgressButtonPressed:(id)sender {
    _todo.todoStatus = inProgress;
    [self checkForStatus:_todo.todoStatus];
    [self.tableView reloadData];
}
- (IBAction)finishedButtonPressed:(id)sender {
    _todo.todoStatus = finished;
    [self checkForStatus:_todo.todoStatus];
    [self.tableView reloadData];
}

// The below function checks thetodoStatus and and updates the underline bar accordingly
- (void)checkForStatus:(TodoStatus)todoStatus {
    switch (todoStatus) {
        case unfinished:
            self.todoUnfinishedUnderlineBar.alpha = 1;
            self.todoFinishedUnderlineBar.alpha = 0;
            self.todoInProgressUnderlineBar.alpha = 0;
            break;
        case inProgress:
            self.todoInProgressUnderlineBar.alpha = 1;
            self.todoUnfinishedUnderlineBar.alpha = 0;
            self.todoFinishedUnderlineBar.alpha = 0;
            break;
        case finished:
            self.todoFinishedUnderlineBar.alpha = 1;
            self.todoUnfinishedUnderlineBar.alpha = 0;
            self.todoInProgressUnderlineBar.alpha = 0;
            break;
        default:
            break;
    }
}

@end
