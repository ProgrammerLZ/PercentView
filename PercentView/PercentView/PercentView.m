//
//  PercentView.m
//  CircleDemo
//
//  Created by 刘哲 on 2017/11/13.
//  Copyright © 2017年 刘哲. All rights reserved.
//

#import "PercentView.h"
#import "CircleView.h"
#import "BackView.h"

@interface PercentView()
@property (nonatomic,strong) BackView *backView;
@property (nonatomic,strong) CircleView *circleView;
@end

@implementation PercentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupView];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;

}


- (void)layoutSubviews
{
    self.backView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.circleView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)refresh
{
    self.circleView.totalValue = 0;
    self.circleView.differentValue = 0;
    self.circleView.currentValue = 0;
    [self.circleView refesh];
}

- (void) setupView
{
    BackView *backView = [[BackView alloc] init];
    CircleView *circleView = [[CircleView alloc] init];
    backView.backgroundColor = [UIColor clearColor];
    [self addSubview:backView];
    [self addSubview:circleView];
    self.backView = backView;
    self.circleView = circleView;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    [self.backView setNeedsDisplay];
    [self.circleView setNeedsDisplay];
}

- (void)setTotalValue:(CGFloat)totalValue
{
    _totalValue = totalValue;
    self.circleView.totalValue = totalValue;
}

- (void)setDifferentValue:(CGFloat)differentValue
{
    if (self.currentValue + differentValue > self.totalValue || self.currentValue +differentValue < 0) {
        return;
    }
    _differentValue = differentValue;
    self.circleView.differentValue = differentValue;
    [self setNeedsDisplay];
}

- (CGFloat)currentValue
{
    return self.circleView.currentValue;
}

@end
