//
//  myContacksView.h
//  myContacks
//
//  Created by Outyua on 14-7-19.
//  Copyright (c) 2014年 Outyua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myContacksView : UIView

@property (nonatomic, weak) NSString *textContent;



- (id)initWithFrame:(CGRect)frame andTextContent:(NSString *) text;


- (void) addImgButton;
- (void) addText;

- (void)delMyRow;

@end
