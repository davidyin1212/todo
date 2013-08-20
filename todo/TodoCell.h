//
//  TodoCell.h
//  todo
//
//  Created by David Yin on 2013-05-18.
//  Copyright (c) 2013 David Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface TodoCell : UITableViewCell {
	Todo        *todo;
    IBOutlet UILabel     *todoTextLabel;
    IBOutlet UILabel     *todoPriorityLabel;
    IBOutlet UIImageView *todoPriorityImageView;
}

@property (nonatomic, retain) IBOutlet UILabel     *todoTextLabel;
@property (nonatomic, retain) IBOutlet UILabel     *todoPriorityLabel;
@property (nonatomic, retain) IBOutlet UIImageView *todoPriorityImageView;

- (UIImage *)imageForPriority:(NSInteger)priority;

- (Todo *)todo;
- (void)setTodo:(Todo *)newTodo;

@end
