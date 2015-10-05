//
//  movieTable.h
//  TabBarWithNav
//
//  Created by Sanzio on 20/09/15.
//  Copyright (c) 2015 Sanzio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface movieController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UITableView *tableView;
    UISegmentedControl *segmentControl;

}

//@property (readwrite) BOOL *videoLIS;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

-(IBAction) segmentedControlChanged;

@end