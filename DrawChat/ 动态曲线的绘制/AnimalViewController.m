//
//  AnimalViewController.m
//  各种曲线折线的绘制
//
//  Created by Apple on 16/4/20.
//  Copyright © 2016年 liuYuGang. All rights reserved.
//

#import "AnimalViewController.h"
#import "AFView.h"
@interface AnimalViewController ()
@end
@implementation AnimalViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];
    NSArray *data = [NSArray arrayWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(1, 40)],
                     [NSValue valueWithCGPoint:CGPointMake(2, 0)],
                     [NSValue valueWithCGPoint:CGPointMake(3, 30)],
                     [NSValue valueWithCGPoint:CGPointMake(4, 0)],
                     [NSValue valueWithCGPoint:CGPointMake(5, 100)],
                     [NSValue valueWithCGPoint:CGPointMake(6, 0)],
                     [NSValue valueWithCGPoint:CGPointMake(7, 100)],
                     nil];
    AFView *af_view = [[AFView alloc] initWithFrame:CGRectMake(30, 120, 350, 350)];
    [af_view setMin_X:1];
    [af_view setMax_X:7];
    [af_view setMin_Y:0];
    [af_view setMax_Y:100];
    [af_view setData:data];
    [af_view setX_labels:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7"]];
    [af_view setY_labels:@[@"0",@"20",@"40",@"60",@"80",@"100"]];
    [self.view addSubview:af_view];
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
