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
}


- (IBAction)addrow:(id)sender {
    //计算出添加的一行的frame
    CGFloat rowWidth = self.view.frame.size.width;
    UIView *lastObj = [self.view.subviews lastObject];
    CGFloat rowY = lastObj.frame.origin.y + lastObj.frame.size.height + 1;
    CGRect frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    //开始添加
    myContacksView *newRow = [[myContacksView alloc] initWithFrame:frame andTextContent:@"123"];
    [self.view addSubview:newRow];
    
    //config trash button useable
    self.delItem.enabled = YES;
    
    
}
- (IBAction)delrow:(id)sender {
    myContacksView *lastObj = [self.view.subviews lastObject];
    [lastObj delMyRow];
    self.delItem.enabled = self.view.subviews.count > 2;
}




@end
