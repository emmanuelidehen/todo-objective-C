//
//  Todo.h
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Enum for the status or progress of the Todos
typedef enum {finished,unfinished,inProgress}TodoStatus;

@interface Todo : NSObject

// Custom Init method for creating 'Todo'
- (id)initWithInformation:(NSString *)todoTitle todoDeadline:(NSString *)todoDeadline todoStatus:(TodoStatus)todoStatus;

// Todo properties
@property (strong,nonatomic) NSString *todoTitle;
@property (strong,nonatomic) NSString *todoDeadline;
@property (nonatomic) TodoStatus todoStatus; // Chosen from our 'TodoStatus' enum

@end
