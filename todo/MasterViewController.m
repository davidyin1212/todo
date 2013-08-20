//
//  MasterViewController.m
//  todo
//
//  Created by David Yin on 2013-08-18.
//  Copyright (c) 2013 David Yin. All rights reserved.
//

#import "MasterViewController.h"
#import "AppDelegate.h"
#import "Todo.h"
#import "TodoCell.h"
#import "DetailViewController.h"

@implementation MasterViewController

@synthesize detailsView;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.title = @"TODO List";
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Tasks";
	
//	TodoCell *cell = (TodoCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//  TodoCell *cell = [[TodoCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
    TodoCell *cell = (TodoCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
		cell = [[TodoCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
	}
    
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	Todo *td = [appDelegate.todos objectAtIndex:indexPath.row];
	[cell setTodo:td];
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
//    }
//    
//    // Set up the cell...
//    TodoCell *info = (TodoCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    Todo *task = [appDelegate.todos objectAtIndex:indexPath.row];
//    cell.textLabel.text = task.text;
//    cell.imageView.image = [info imageForPriority:task.priority];
//    if (task.priority == 1) {
//    } else if (task.priority == 2) {
//        
//    } else if (task.priority == 3) {
//        
//    }
//	
	// Set up the cell
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *viewController = [segue destinationViewController];
    self.detailsView = viewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Todo *todo = (Todo *)[appDelegate.todos objectAtIndex:[path row]];
    if(self.detailsView == nil) {
//        DetailViewController *viewController = [[DetailViewController alloc]
//                                                initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
//        self.detailsView = viewController;
    }
    
    //[self.navigationController pushViewController:self.detailsView animated:YES];
    self.detailsView.todo = todo;
    self.detailsView.title = todo.text;
    [self.detailsView.todoText setText:todo.text];
    
    NSInteger priority = todo.priority - 1;
    if(priority > 2 || priority < 0) {
        priority = 1;
    }
    priority = 2 - priority;
    
    [self.detailsView.todoPriority setSelectedSegmentIndex:priority];
    
    if(todo.status == 1) {
        [self.detailsView.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateNormal];
        [self.detailsView.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateHighlighted];
        [self.detailsView.todoStatus setText:@"Complete"];
    } else {
        [self.detailsView.todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
        [self.detailsView.todoButton setTitle:@"Mark As Complete" forState:UIControlStateHighlighted];
        [self.detailsView.todoStatus setText:@"In Progress"];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    }

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

@end
