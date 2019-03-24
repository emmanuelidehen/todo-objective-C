//
//  MainVC.m
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import "MainVC.h"
#import "Todo.h"
#import "TodoViewCell.h"
#import "ViewTodoVC.h"
#import "AddTodoVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Inits an array
    _arrayOfTodos = [[NSMutableArray alloc]init];
    
    // Populates the array with 'Todos'
    [_arrayOfTodos addObject: [[Todo alloc]initWithInformation:@"Fly Back to SF" todoDeadline:@"8/6/17" todoStatus:inProgress]];
    [_arrayOfTodos addObject: [[Todo alloc]initWithInformation:@"Wash Clothes" todoDeadline:@"4/11/17" todoStatus:inProgress]];
    [_arrayOfTodos addObject: [[Todo alloc]initWithInformation:@"Read Books" todoDeadline:@"5/11/17" todoStatus:unfinished]];
    [_arrayOfTodos addObject: [[Todo alloc]initWithInformation:@"Cook Pasta" todoDeadline:@"3/9/17" todoStatus:finished]];
    [_arrayOfTodos addObject: [[Todo alloc]initWithInformation:@"Feed Dog" todoDeadline:@"1/1/17" todoStatus:finished]];
}

// cellForRow funtiontion needed for any tableview in an ios app
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    
    // Sets the statusbarView color according to 'ToDo' status
    cell.statusbarView.backgroundColor = [cell returnColorFromCompetionStatus:[[_arrayOfTodos objectAtIndex:indexPath.row] todoStatus]];
    
    // Sets todoTitleLabel for each object
    cell.todoTitleLabel.text = [[_arrayOfTodos objectAtIndex:indexPath.row] todoTitle];
    
    // Sets todoDeadlineLabel for each object
    cell.todoDeadlineLabel.text = [[_arrayOfTodos objectAtIndex:indexPath.row] todoDeadline];
    return cell;
}

// Returns the count of objects in _arrayOfTodos
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayOfTodos.count;
}

/*
 
 // The function below adds the delete fuctionality
 
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 printf("Delete perssed");
 NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
 Todo *todo = [_arrayOfTodos objectAtIndex:indexPath.row];
 [_arrayOfTodos removeObject:todo];
 [tableView reloadData];
 }
 }
 
 */

// Passes view controler data to the other view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqual: @"showTodo"]){
        ViewTodoVC *destination = (ViewTodoVC *)segue.destinationViewController; // Sets segue destinaiton
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; // Grabs indexPath of selected cell
        Todo *todo = [_arrayOfTodos objectAtIndex:indexPath.row]; // Sets tht 'todo' variable object to the 'Todo' selected
        destination.tableView = self.tableView; // Sets the destinations 'tableView' varible
        destination.todo = todo; // Sets the destinations 'todo' varible
    } else if ([segue.identifier isEqual: @"addTodo"]){
        AddTodoVC *destination = (AddTodoVC *)segue.destinationViewController; // Sets segue destinaiton
        destination.mainVC = self; // Sets the destinations 'mainVC' varible
    }
}

/*
 The function below adds specific options to each cell when the user swipes for options
 Adding the buttons could be refactored into a function for future use
 */

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *unfinishedButton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Unfinished" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                    {
                                        Todo *todo = [_arrayOfTodos objectAtIndex:indexPath.row];
                                        todo.todoStatus = unfinished; // Sets 'Todo' status
                                        [tableView reloadData];
                                        
                                    }];
    unfinishedButton.backgroundColor = [UIColor colorWithRed:225/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    
    UITableViewRowAction *inProgressButton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"In Progress" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                     {
                                         Todo *todo = [_arrayOfTodos objectAtIndex:indexPath.row];
                                         todo.todoStatus = inProgress;
                                         [tableView reloadData];
                                     }];
    inProgressButton.backgroundColor =  [UIColor colorWithRed:237/255.0 green:173/255.0 blue:97/255.0 alpha:1.0]; //arbitrary color
    
    UITableViewRowAction *finishedButton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Finished" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                     {
                                         Todo *todo = [_arrayOfTodos objectAtIndex:indexPath.row];
                                         todo.todoStatus = finished;
                                         [tableView reloadData];
                                     }];
    finishedButton.backgroundColor = [UIColor colorWithRed:85/255.0 green:176/255.0 blue:112/255.0 alpha:1.0]; //arbitrary color
    
    return @[unfinishedButton, inProgressButton, finishedButton]; // Return array of buttons
}

@end
