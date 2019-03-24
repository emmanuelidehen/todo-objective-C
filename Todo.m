//
//  Todo.m
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import "Todo.h"

@implementation Todo

// Custom Init method for creating 'Todo'
- (id)initWithInformation:(NSString *)todoTitle todoDeadline:(NSString *)todoDeadline todoStatus:(TodoStatus)todoStatus
{
    self = [super init];
    if (self) {
        _todoTitle = [[NSString alloc]init];
        _todoTitle = todoTitle;
        _todoDeadline = [[NSString alloc] init];
        _todoDeadline = todoDeadline;
        _todoStatus = todoStatus;
    }
    return self;
}

@end
