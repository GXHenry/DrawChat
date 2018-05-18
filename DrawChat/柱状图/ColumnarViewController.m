//
//  ColumnarViewController.m
//  各种曲线折线的绘制
//
//  Created by Apple on 16/4/20.
//  Copyright © 2016年 liuYuGang. All rights reserved.
//

#import "ColumnarViewController.h"
#import "BarChart.h"
@interface ColumnarViewController ()

@end

@implementation ColumnarViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @" 柱状图";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];

    NSArray *values = @[@20,@12,@28,@20,@15,@45];

    BarChart *barChart = [[BarChart alloc] initWithFrame:CGRectMake(50, 100, 320, 300)
                                            values:values];
    [self.view addSubview:barChart];
    barChart.barColor  = [UIColor colorWithRed:0.344 green:1.0 blue:0.4397 alpha:1.0]
    ;
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
