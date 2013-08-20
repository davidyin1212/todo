//
//  AppDelegate.h
//  todo
//
//  Created by David Yin on 2013-05-18.
//  Copyright (c) 2013 David Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "TOdo.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    sqlite3 *database;
	NSMutableArray *todos;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *todos;

-(void)removeTodo:(Todo *)todo;
-(Todo *)addTodo;

@end
