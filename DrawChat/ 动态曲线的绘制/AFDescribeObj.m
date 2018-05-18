    //
    //  AnimalViewController.m
    //  各种曲线折线的绘制
    //
    //  Created by Apple on 16/4/20.
    //  Copyright © 2016年 liuYuGang. All rights reserved.
    //

#import "AFDescribeObj.h"

@implementation AFDescribeObj
{
    NSArray *types;
    CGFloat startTime;
    CGFloat duration;
}
@synthesize containerView;
@synthesize type;
@synthesize shapeLayers;
@synthesize basicAnimation;

- (id)initWithType:(AFAnimationType)af_type inView:(UIView *)view
{
    self = [super init];
    
    if (self)
    {
        self.type = af_type;
        self.containerView = view;
        
        shapeLayers = [NSArray array];
        
        types = @[@"strokeEnd"];
    }
    
    return self;
}

- (void)setStartTime:(CGFloat)af_startTime andDuration:(CGFloat)af_duration{
    startTime = af_startTime;
    duration = af_duration;
    basicAnimation = [CABasicAnimation animationWithKeyPath:types[type]];
    basicAnimation.delegate = containerView;
    basicAnimation.duration = af_duration+af_startTime;
    basicAnimation.fromValue = [NSNumber numberWithFloat:-af_startTime/af_duration];
    basicAnimation.toValue = [NSNumber numberWithFloat:1.0];
}

- (void)addLineFrom:(CGPoint)from toPoint:(CGPoint)to color:(UIColor *)color{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:from];
    [path addLineToPoint:to];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = containerView.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = color.CGColor;
    pathLayer.lineWidth = 2.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    [pathLayer addAnimation:basicAnimation forKey:types[type]];
    NSMutableArray *ary = [NSMutableArray arrayWithArray:shapeLayers];
    [ary addObject:pathLayer];
    shapeLayers = [NSArray arrayWithArray:ary];
    [containerView.layer addSublayer:pathLayer];
}

@end
