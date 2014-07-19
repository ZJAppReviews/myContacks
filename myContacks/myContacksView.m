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
    NSLog(@"%@", lab);
}

//Click
- (void)imgClick {
    NSLog(@"%@" , self.textContent);
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
