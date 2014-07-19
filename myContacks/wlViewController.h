//
//  wlViewController.h
//  myContacks
//
//  Created by Outyua on 14-7-17.
//  Copyright (c) 2014年 Outyua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wlViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIBarButtonItem *delItem;
- (IBAction)addrow:(id)sender;
- (IBAction)delrow:(id)sender;
@end
