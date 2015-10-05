//
//  TabBarController.h
//  TabBarWithNav
//
//  Created by Sanzio on 30/09/15.
//  Copyright © 2015 Sanzio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController: UITabBarController
{
    UISegmentedControl *segmentControl;
@public
    BOOL *videoLIS;
}

@property (readwrite) BOOL *videoLIS;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;
-(IBAction) segmentedControlChanged;

//@property (nonatomic) BOOL *checkSegmentedControlState;

-(BOOL) statoLIS;
-(BOOL) checkSegmentedControlState;
@end

