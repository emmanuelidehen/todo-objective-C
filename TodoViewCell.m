//
//  TodoViewCell.m
//  objc_mvc_todo
//
//  Created by Emmanuel on 26/5/18.
//  Copyright © 2018 Emmanuel idehen. All rights reserved.
//

#import "TodoViewCell.h"

@implementation TodoViewCell

// Update the color bar the right side of the 'TodoViewCell'
- (UIColor *)returnColorFromCompetionStatus:(TodoStatus)status {
        switch(status) {
        case unfinished:
        {
            return [UIColor colorWithRed:225/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
            break;
        }
        case finished:
        {
            return [UIColor colorWithRed:85/255.0 green:176/255.0 blue:112/255.0 alpha:1.0];
            break;
        }
        case inProgress:
        {
            return [UIColor colorWithRed:237/255.0 green:173/255.0 blue:97/255.0 alpha:1.0];
            break;
        }
        default:
            break;
    }
}

@end
