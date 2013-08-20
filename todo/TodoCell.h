//
//  TodoCell.h
//  todo
//
//  Created by Brandon Trebitowski on 9/1/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
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
