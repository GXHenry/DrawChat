//
//  ShapeViewController.m
//  各种曲线折线的绘制
//
//  Created by Apple on 16/4/20.
//  Copyright © 2016年 liuYuGang. All rights reserved.
//

#import "ShapeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomView.h"
@interface ShapeViewController ()

@end

@implementation ShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];

    CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 50,
                                                                        self.view.bounds.size.width,
                                                                         self.view.frame.size.height)];
    [self.view addSubview:customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
