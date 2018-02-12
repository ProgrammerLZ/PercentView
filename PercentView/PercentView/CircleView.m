//
//  CIrcleView.m
//  CircleDemo
//
//  Created by 刘哲 on 2017/11/10.
//  Copyright © 2017年 刘哲. All rights reserved.
//

#import "CircleView.h"

static CGFloat radian = (2 * M_PI);
@interface CircleView()

@property (nonatomic,strong) UIColor *strokeColor;
@property (nonatomic) NSUInteger inset;
@property (nonatomic) NSUInteger lineWidth;
@property (nonatomic) CGFloat showValue;
@property (nonatomic,strong) CAShapeLayer *animateLayer;
@property (nonatomic) BOOL animate;
@end

@implementation CircleView

-(void)refesh
{
    self.animate = NO;
    [self setNeedsDisplay];
}


- (void)setDifferentValue:(CGFloat)differentValue
{
    self.animate = YES;
    _differentValue = differentValue;
    self.currentValue += differentValue;
}

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

    CGFloat radius =  MIN(rect.size.width,rect.size.height) / 2;
    CGPoint center = CGPointMake(rect.size.width / 2,rect.size.height / 2);
    
    UIColor * red = [UIColor colorWithRed:253.0/255.0 green:65.0/255.0 blue:81.0/255.0 alpha:1];
    UIColor * yellow = [UIColor colorWithRed:255.0/255.0 green:221.0/255.0 blue:77.0/255.0 alpha:1];
    UIColor * blue = [UIColor colorWithRed:79.0/255.0 green:183.0/255.0 blue:129.0/255.0 alpha:1];
    UIColor * green = [UIColor colorWithRed:22.0/255.0 green:163.0/255.0 blue:255.0/255.0 alpha:1];
    

    /*方案一*/
    /*
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];//yellow
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];//red
    CAGradientLayer *gradientLayer3 = [CAGradientLayer layer];//blue
    CAGradientLayer *gradientLayer4 = [CAGradientLayer layer];//green

    gradientLayer1.frame = CGRectMake(0, 0, rect.size.width / 2, rect.size.height / 2);
    gradientLayer2.frame = CGRectMake(rect.size.width / 2, 0, rect.size.width / 2, rect.size.height/2);
    gradientLayer3.frame = CGRectMake(rect.size.width / 2, rect.size.height/2, rect.size.width / 2, rect.size.height/2);
    gradientLayer4.frame = CGRectMake(0, rect.size.width / 2, rect.size.width / 2, rect.size.height/2);
    
    [self.layer addSublayer:gradientLayer1];
    [self.layer addSublayer:gradientLayer2];
    [self.layer addSublayer:gradientLayer3];
    [self.layer addSublayer:gradientLayer4];
    
    gradientLayer1.colors =@[ (__bridge id)yellow.CGColor, (__bridge id)red.CGColor];
    gradientLayer2.colors =@[ (__bridge id)red.CGColor, (__bridge id)blue.CGColor];
    gradientLayer3.colors =@[ (__bridge id)blue.CGColor, (__bridge id)green.CGColor];
    gradientLayer4.colors =@[ (__bridge id)green.CGColor, (__bridge id)yellow.CGColor];

    gradientLayer1.startPoint = CGPointMake(0,0.5);
    gradientLayer2.startPoint = CGPointMake(0.5,0);
    gradientLayer3.startPoint = CGPointMake(1,0.5);
    gradientLayer4.startPoint = CGPointMake(0.5,1);
    
    gradientLayer1.endPoint = CGPointMake(1,0.5);
    gradientLayer2.endPoint = CGPointMake(0.5,1);
    gradientLayer3.endPoint = CGPointMake(0,0.5);
    gradientLayer4.endPoint = CGPointMake(0.5,0);
    
    gradientLayer1.locations = @[@0,@0.8];
    gradientLayer2.locations = @[@0,@0.8];
    gradientLayer3.locations = @[@0,@0.8];
    gradientLayer4.locations = @[@0,@0.8];
    */
    
    
    //方案二
    UIColor *fromColour;
    UIColor *toColour;
    double  angle =  (2 * M_PI) / 360.0;
    for (int i = 0; i < 4; i++) {
        if (i == 0) {
            fromColour = blue;
            toColour = green;
        }
        if (i == 1) {
            fromColour = green;
            toColour = yellow;
        }
        if (i == 2) {
            fromColour = yellow;
            toColour = red;
        }
        if (i == 3) {
            fromColour = red;
            toColour = blue;
        }

        NSMutableArray * spectrumColours = [NSMutableArray new];
        
        double fR, fG, fB;
        double tR, tG, tB;
        [fromColour getRed:&fR green:&fG blue:&fB alpha:nil];
        [toColour getRed:&tR green:&tG blue:&tB alpha:nil];
        
        int numberOfColours = 90;
        double dR = (tR-fR)/(numberOfColours-1);
        double dG = (tG-fG)/(numberOfColours-1);
        double dB = (tB-fB)/(numberOfColours-1);
        
        for (int n = 0; n < numberOfColours; n++){
            [spectrumColours addObject:[UIColor colorWithRed:(fR+n*dR) green:(fG+n*dG) blue:(fB+n*dB) alpha:1.0f]];
        }
        
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(ctx, radius);

        for (CGFloat m = 0; m < spectrumColours.count; m++)
        {
            UIBezierPath *path;
            UIColor* c = [spectrumColours objectAtIndex:m];
            CGFloat startAngle = m * angle +(i*(M_PI / 2));
            CGFloat endAngle = startAngle + angle + 0.02;
            path = [UIBezierPath bezierPathWithArcCenter:center radius:radius  startAngle:startAngle endAngle:endAngle clockwise:YES];
            path.lineWidth = radius *2;
            [c setStroke];
            [path stroke];


        }
    }

    
    /*方案三
    CGFloat arcStep = (M_PI *2) / 360;
    BOOL clocklwise = NO;
    CGFloat x = CGRectGetWidth(rect) / 2;
    CGFloat y = CGRectGetHeight(rect) / 2;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, radius*2);
    for (CGFloat i = 0; i < 360; i+=1)
    {
        UIColor* c = [UIColor colorWithHue:i/360 saturation:1. brightness:1. alpha:1];
        
        CGContextSetStrokeColorWithColor(ctx, c.CGColor);
        
        CGFloat startAngle = i * arcStep;
        CGFloat endAngle = startAngle + arcStep + 0.02;
        
        CGContextAddArc(ctx, x, y, radius, startAngle, endAngle, clocklwise);
        CGContextStrokePath(ctx);
    }
     */
    
    //setter里边currentValue已经加了一个diffentValue,所以此处逻辑反转。
    CGFloat fromValue = (self.currentValue - self.differentValue) / self.totalValue;//起始百分比
    CGFloat toValue = self.currentValue  / self.totalValue;//终止百分比
    
    if (fromValue<0 || fromValue >1) {
        fromValue = 0;
    }
    
    if (toValue <0 || toValue >1) {
        toValue = 1;
    }

    if (self.animateLayer == nil) {
        self.animateLayer = [CAShapeLayer layer];
        self.animateLayer.fillColor = [UIColor clearColor].CGColor;
        self.animateLayer.strokeColor = self.strokeColor.CGColor;
        self.animateLayer.lineWidth = self.lineWidth;
    }
    
    self.animateLayer.path = [UIBezierPath bezierPathWithArcCenter:center radius:radius  - self.inset startAngle:-M_PI/2 endAngle:3*M_PI/2 clockwise:YES].CGPath;
    self.animateLayer.strokeStart = 0;
    self.animateLayer.strokeEnd  = toValue;

    self.layer.mask = self.animateLayer;
    
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = 0.5;
    drawAnimation.repeatCount         = 1;
    drawAnimation.removedOnCompletion = NO;
    drawAnimation.fromValue = @(fromValue);
    drawAnimation.toValue   = @(toValue);
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.animateLayer addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
}

@end
