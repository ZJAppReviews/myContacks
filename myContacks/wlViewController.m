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
@property (nonatomic,  ) NSString *labelContent;
@end

@implementation wlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myScrollView.contentSize = CGSizeMake(0, 0);
    self.myScrollView.showsHorizontalScrollIndicator=NO;
    self.myScrollView.showsVerticalScrollIndicator=NO;
    //self.myScrollView.pagingEnabled = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)addrow:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加联系人" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    //set alert style
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
}
- (IBAction)delrow:(id)sender {
    myContacksView *lastObj = [self.myScrollView.subviews lastObject];
    [lastObj delMyRow];
    CGFloat rowY = lastObj.frame.origin.y - 1;
    self.myScrollView.contentSize = CGSizeMake(320, rowY);
    self.delItem.enabled = self.myScrollView.subviews.count > 1;
}
//真正添加联系人代码
- (void) didAddRow {
    //计算出添加的一行的frame
    
    CGFloat rowWidth = self.myScrollView.frame.size.width;
    UIView *lastObj = [self.myScrollView.subviews lastObject];
    CGFloat rowY = lastObj.frame.origin.y + lastObj.frame.size.height + 1;
    CGFloat scrollH = rowY + kRowHeight;
    self.myScrollView.contentSize = CGSizeMake(320, scrollH);
    
    CGRect frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    //开始添加
    myContacksView *newRow = [[myContacksView alloc] initWithFrame:frame andTextContent:self.labelContent];
    //[self.myScrollView addSubview:newRow];
    [self.myScrollView addSubview:newRow];
    //[self.view addSubview:newRow];
    //config trash button useable
    self.delItem.enabled = YES;
}
#pragma mark - alert Delegage
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *lc = [alertView textFieldAtIndex:0].text;
        self.labelContent = lc;
        [self didAddRow];
    }
}

@end
