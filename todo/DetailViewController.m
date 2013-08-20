//
//  DetailViewController.m
//  todo
//
//  Created by David Yin on 2013-05-18.
//  Copyright (c) 2013 David Yin. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Todo.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize todoText,todo,todoButton,todoPriority,todoStatus;

#pragma mark - Managing the detail item

- (IBAction)updateStatus:(id)sender {
    if(self.todo.status == 0) {
		[self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateNormal];
		[self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateHighlighted];
		[self.todoStatus setText:@"Complete"];
		[self.todo updateStatus:1];
	} else {
		[self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
		[self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateHighlighted];
		[self.todoStatus setText:@"In Progress"];
		[self.todo updateStatus:0];
	}
}

- (IBAction)updatePriority:(id)sender {
    int priority = [self.todoPriority selectedSegmentIndex];
	[self.todo updatePriority:(2-priority+1)];
}

- (void)setDetailItem:(id)newDetailItem
{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//        
//        // Update the view.
//        [self configureView];
//    }
}
- (IBAction)updateText:(id)sender {
    self.todo.text = self.todoText.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    Todo *todo = (Todo *)[appDelegate.todos objectAtIndex];
    
//    if(self.detailsView == nil) {
//        DetailViewController *viewController = [[DetailViewController alloc]
//                                                initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
//        self.detailsView = viewController;
//    }
    
//    [self.navigationController pushViewController:self.detailsView animated:YES];
    self.todo = todo;
    self.title = todo.text;
    [self.todoText setText:todo.text];
    
    NSInteger priority = todo.priority - 1;
    if(priority > 2 || priority < 0) {
        priority = 1;
    }
    priority = 2 - priority;
    
    [self.todoPriority setSelectedSegmentIndex:priority];
    
    if(todo.status == 1) {
        [self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateNormal];
        [self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateHighlighted];
        [self.todoStatus setText:@"Complete"];
    } else {
        [self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
        [self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateHighlighted];
        [self.todoStatus setText:@"In Progress"];
    }
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
