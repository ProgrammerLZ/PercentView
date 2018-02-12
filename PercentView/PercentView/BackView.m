//
//  BackView.m
//  CircleDemo
//
//  Created by 刘哲 on 2017/11/13.
//  Copyright © 2017年 刘哲. All rights reserved.
//

#import "BackView.h"
@interface BackView()
@property (nonatomic,strong) UIColor *fillColor;
@property (nonatomic,strong) UIColor *strokeColor;
@property (nonatomic) NSUInteger inset;
@property (nonatomic) NSUInteger lineWidth;
@property (nonatomic,strong) CAShapeLayer *backLayer;
@property (nonatomic,strong) CAShapeLayer *circleLayer;
@end

@implementation BackView

- (void)drawRect:(CGRect)rect {
    if (self.inset == 0) {
        self.inset = 19;
    }
    
    if (self.lineWidth == 0) {
        self.lineWidth = 4;
    }

    if (self.strokeColor == nil) {
        self.strokeColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1];
    }

    if (self.fillColor == nil) {
        self.fillColor = [UIColor whiteColor];
    }
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat radius =  MIN(rect.size.width,rect.size.height);
    CGPoint center = CGPointMake(rect.size.width / 2,rect.size.height / 2);
    NSInteger shadowOffSet = 4;
    


//    [strokePath setLineWidth:self.lineWidth];
//    [self.strokeColor setStroke];
//    [strokePath stroke];
    
//    CGContextSetShadowWithColor(context, CGSizeMake(shadowOffSet, shadowOffSet), 0.0, [[UIColor lightGrayColor] CGColor]);
//    [self.fillColor setFill];
//    CGContextDrawPath(context, kCGPathFill);
//    [backPath fill];
    
    UIBezierPath *strokePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius/2.0  - self.inset startAngle:0 endAngle:2 * M_PI clockwise:YES];
    UIBezierPath *backPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius/2.0 - shadowOffSet startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    if (self.backLayer == nil) {
        self.backLayer = [CAShapeLayer layer];
        [self.layer addSublayer:self.backLayer];
    }
    self.backLayer.path = backPath.CGPath;
    self.backLayer.fillColor = self.fillColor.CGColor;
    self.backLayer.shadowPath = backPath.CGPath;
    self.backLayer.shadowColor = [UIColor blackColor].CGColor;
    self.backLayer.shadowOffset = CGSizeMake(shadowOffSet, shadowOffSet);
    self.backLayer.shadowOpacity = 0.1;
    
    if (self.circleLayer == nil) {
        self.circleLayer = [CAShapeLayer layer];
        [self.layer addSublayer:self.circleLayer];
    }
    self.circleLayer.path = strokePath.CGPath;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.lineWidth = self.lineWidth;
    self.circleLayer.strokeColor = self.strokeColor.CGColor;
}

@end
