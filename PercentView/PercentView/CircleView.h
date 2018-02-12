//
//  CIrcleView.h
//  CircleDemo
//
//  Created by 刘哲 on 2017/11/10.
//  Copyright © 2017年 刘哲. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CircleView : UIView

@property (nonatomic) CGFloat totalValue;//全部的值
@property (nonatomic) CGFloat differentValue;//改变值
@property (nonatomic) CGFloat currentValue;//当前值
- (void) refesh;
@end
