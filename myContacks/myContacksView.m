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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)addImgButton:(NSString *)imgPath {
    
}
- (void)addText:(NSString *)textContent {
    UILabel *lab = [[UILabel alloc] init];
    lab.text = textContent;
   
   
    lab.frame = CGRectMake(0, 0, 200, 40);
    [self addSubview:lab];
    NSLog(@"%f--%f", self.center.x, self.center.y);
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
