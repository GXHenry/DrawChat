    //
    //  AnimalViewController.m
    //  各种曲线折线的绘制
    //
    //  Created by Apple on 16/4/20.
    //  Copyright © 2016年 liuYuGang. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum
{
    AFAnimationStrokeEnd = 0
}AFAnimationType;

@interface AFDescribeObj : NSObject

@property (nonatomic, weak) UIView *containerView;
@property (nonatomic) AFAnimationType type;
@property (nonatomic, strong) NSArray *shapeLayers;
@property (nonatomic, strong) CABasicAnimation *basicAnimation;

- (id)initWithType:(AFAnimationType)af_type inView:(UIView *)view;

- (void)setStartTime:(CGFloat)af_startTime andDuration:(CGFloat)af_duration;

- (void)addLineFrom:(CGPoint)from toPoint:(CGPoint)to color:(UIColor *)color;

@end
