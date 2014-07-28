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
    self.myScrollView.contentSize = CGSizeMake(0, 0);
    self.myScrollView.showsHorizontalScrollIndicator=NO;
    self.myScrollView.showsVerticalScrollIndicator=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)addrow:(id)sender {
    //计算出添加的一行的frame
    CGFloat rowWidth = self.myScrollView.frame.size.width;
    UIView *lastObj = [self.myScrollView.subviews lastObject];
    CGFloat rowY = lastObj.frame.origin.y + lastObj.frame.size.height + 1;
    CGFloat scrollH = rowY + kRowHeight;
    self.myScrollView.contentSize = CGSizeMake(320, scrollH);
    
    CGRect frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    //开始添加
    myContacksView *newRow = [[myContacksView alloc] initWithFrame:frame andTextContent:@"123"];
    //[self.myScrollView addSubview:newRow];
    [self.myScrollView addSubview:newRow];
    //[self.view addSubview:newRow];
    //config trash button useable
    self.delItem.enabled = YES;
    NSLog(@"%@", self.myScrollView.subviews);
    
}
- (IBAction)delrow:(id)sender {
    myContacksView *lastObj = [self.myScrollView.subviews lastObject];
    [lastObj delMyRow];
    CGFloat rowY = lastObj.frame.origin.y - kRowHeight - 1;
    self.myScrollView.contentSize = CGSizeMake(320, rowY);
    self.delItem.enabled = self.myScrollView.subviews.count > 1;
}




@end
