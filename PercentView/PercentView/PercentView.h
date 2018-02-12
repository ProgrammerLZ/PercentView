//
//  PercentView.h
//  CircleDemo
//
//  Created by 刘哲 on 2017/11/13.
//  Copyright © 2017年 刘哲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackView.h"
#import "CircleView.h"
@interface PercentView : UIView
/*
 算法：
 终点百分比 = 当前起点百分比 + ∆百分比（增量可以为正也可以为负）
 
 0<=终点百分比=<1
 
 */
@property (nonatomic) CGFloat totalValue;//全部的值
@property (nonatomic) CGFloat differentValue;//改变值
@property (nonatomic,readonly) CGFloat currentValue;//当前值   
@property (nonatomic,readonly,strong) BackView *backView;
@property (nonatomic,readonly,strong) CircleView *circleView;
- (void) refresh;
@end
