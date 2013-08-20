//
//  DetailViewController.h
//  todo
//
//  Created by David Yin on 2013-08-18.
//  Copyright (c) 2013 David Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController {
	IBOutlet UITextView         *todoText;
	IBOutlet UISegmentedControl *todoPriority;
	IBOutlet UILabel            *todoStatus;
	IBOutlet UIButton			*todoButton;
	Todo						*todo;
}

@property(nonatomic,retain) IBOutlet UITextView         *todoText;
@property(nonatomic,retain) IBOutlet UISegmentedControl *todoPriority;
@property(nonatomic,retain) IBOutlet UILabel            *todoStatus;
@property(nonatomic,retain) IBOutlet UIButton           *todoButton;
@property(nonatomic,retain) Todo						*todo;

- (IBAction) updateStatus:(id) sender;
- (IBAction) updatePriority:(id) sender;

@end
