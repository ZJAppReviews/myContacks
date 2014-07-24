//
//  myContacksView.m
//  myContacks
//
//  Created by Outyua on 14-7-19.
//  Copyright (c) 2014年 Outyua. All rights reserved.
//
#define kRowHeight 70
#import "myContacksView.h"

@implementation myContacksView

- (id)initWithFrame:(CGRect)frame andTextContent:(NSString *)text
{
    
    self.textContent = text;
    CGRect myFrame = CGRectMake(frame.origin.x-320, frame.origin.y, frame.size.width, frame.size.height);
    self = [super initWithFrame:myFrame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor greenColor];
    }
    self.layer.opacity = 0.3;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    
    self.frame = frame;
    self.layer.opacity = 1;
    
    
    [self addText];
    [self addImgButton];
    [UIView commitAnimations];
    return self;
}

- (void)addImgButton {
    NSString *imgPath = [self getRandom];
    UIButton *imgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imgButton.center = CGPointMake(40, self.bounds.size.height*0.5);
    imgButton.bounds = CGRectMake(0, 0, 44, 44);
    //get image
    UIImage *image = [UIImage imageNamed:imgPath];
    [imgButton setBackgroundImage:image forState:UIControlStateNormal];
    [imgButton addTarget:self action:@selector(imgClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:imgButton];
    
    
}
- (void)addText {
    UILabel *lab = [[UILabel alloc] init];
    
    lab.text = self.textContent;
    //lab.backgroundColor = [UIColor grayColor];
    [self addSubview:lab];
    [lab sizeToFit];
    //lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor clearColor];
    lab.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
    //NSLog(@"%@", lab);
}

//Click
- (void)imgClick {
    NSLog(@"%@" , self.textContent);
}

- (void)delMyRow {
    //animations
    [UIView animateWithDuration:0.3 animations:^(void){
        self.frame = CGRectMake(320, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
        self.layer.opacity = 0.3;
        //这里相当于在begin和commint之间
    }completion:^(BOOL finished){
        //这里相当于动画执行完成后要执行的方法，可以继续嵌套block
        [self removeFromSuperview];
        
    }];
}


- (NSString *)getRandom {
    //int index = arc4random()%8;
    int index = arc4random_uniform(8);//生成0-8的随机整数
    NSString *str = [NSString stringWithFormat:@"%d", index];
    return str;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
