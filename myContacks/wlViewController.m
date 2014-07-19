//
//  wlViewController.m
//  myContacks
//
//  Created by Outyua on 14-7-17.
//  Copyright (c) 2014年 Outyua. All rights reserved.
//
#define kRowHeight 70
#import "wlViewController.h"
#import "myContacksView.h"
@interface wlViewController ()

@end

@implementation wlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addrow:(id)sender {
    NSLog(@"add");
    // add subview
    //UIView *newRow = [[UIView alloc] init];
    CGFloat rowWidth = self.view.frame.size.width;
    UIView *lastObj = [self.view.subviews lastObject];
    CGFloat rowY = lastObj.frame.origin.y + lastObj.frame.size.height + 1;
    //newRow.backgroundColor = [UIColor grayColor];
    
    //newRow.frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    CGRect frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    
    myContacksView *newRow = [[myContacksView alloc] initWithFrame:frame];
    
    [self.view addSubview:newRow];
    [newRow addText:@"123"];
    
    //config trash button useable
    self.delItem.enabled = YES;
}
- (IBAction)delrow:(id)sender {
    NSLog(@"delete");
    
    UIView *lastObj = [self.view.subviews lastObject];
    [lastObj removeFromSuperview];
    
    self.delItem.enabled = self.view.subviews.count > 1;
  
    
}

@end
