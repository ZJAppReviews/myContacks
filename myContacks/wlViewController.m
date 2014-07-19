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
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.4];
    //UIView *newRow = [[UIView alloc] init];
    CGFloat rowWidth = self.view.frame.size.width;
    UIView *lastObj = [self.view.subviews lastObject];
    CGFloat rowY = lastObj.frame.origin.y + lastObj.frame.size.height + 1;
    //newRow.backgroundColor = [UIColor grayColor];
    
    //newRow.frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    CGRect frame = CGRectMake(0, rowY, rowWidth, kRowHeight);
    
    myContacksView *newRow = [[myContacksView alloc] initWithFrame:frame];
    
    [self.view addSubview:newRow];
    newRow.textContent = @"1234567";
    [newRow addText];
    [newRow addImgButton:[self getRandom]];
    //config trash button useable
    self.delItem.enabled = YES;
    
    [UIView commitAnimations];
}
- (IBAction)delrow:(id)sender {

    UIView *lastObj = [self.view.subviews lastObject];
    
   
    //animations
    [UIView animateWithDuration:1 animations:^(void){
        lastObj.frame = CGRectMake(320, 20, lastObj.bounds.size.width, lastObj.bounds.size.height);
        lastObj.layer.opacity = 0.1;
        //这里相当于在begin和commint之间
    }completion:^(BOOL finished){
        //这里相当于动画执行完成后要执行的方法，可以继续嵌套block
        [lastObj removeFromSuperview];
        self.delItem.enabled = self.view.subviews.count > 1;
    }];
    
}



- (NSString *)getRandom {
    //int index = arc4random()%8;
    int index = arc4random_uniform(8);//生成0-8的随机整数
    NSString *str = [NSString stringWithFormat:@"%d", index];
    return str;
}
@end
