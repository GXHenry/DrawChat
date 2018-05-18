//
//  PieChartViewController.m
//  各种曲线折线的绘制
//
//  Created by Apple on 16/4/21.
//  Copyright © 2016年 liuYuGang. All rights reserved.
//

#import "PieChartViewController.h"
#import "CLMView.h"
@interface PieChartViewController ()

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];

    self.view.backgroundColor = [UIColor colorWithPatternImage:
                                 [UIImage imageNamed:@"back.jpg"]];

    CLMView *cv = [[CLMView alloc] initWithFrame:
                   CGRectMake(0, 100, self.view.bounds.size.width, 440)];

    cv.titleArr = [NSArray	arrayWithObjects:@"iphone",
                   @"sybian", @"windowbile",
                   @"mego",@"android",nil];
    cv.valueArr = [NSArray arrayWithObjects:
                   [NSNumber numberWithFloat:20],
                   [NSNumber numberWithFloat:20],\
                   [NSNumber numberWithFloat:20],[NSNumber numberWithFloat:20],[NSNumber numberWithFloat:20],nil];
    cv.colorArr = [NSArray arrayWithObjects:[UIColor yellowColor],
                   [UIColor blueColor],
                   [UIColor brownColor],
                   [UIColor purpleColor] ,
                   [UIColor orangeColor],nil];
    [self.view addSubview: cv];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
