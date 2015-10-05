//
//  introTable.h
//  TabBarWithNav
//
//  Created by Sanzio on 20/09/15.
//  Copyright (c) 2015 Sanzio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface introTable : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
