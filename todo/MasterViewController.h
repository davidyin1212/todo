//
//  MasterViewController.h
//  todo
//
//  Created by David Yin on 2013-08-18.
//  Copyright (c) 2013 David Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface MasterViewController : UITableViewController {
    DetailViewController *detailsView;
}

@property(nonatomic,retain) DetailViewController *detailsView;

@end
