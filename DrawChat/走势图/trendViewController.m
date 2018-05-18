//
//  trendViewController.m
//  各种曲线折线的绘制
//
//  Created by Apple on 16/4/20.
//  Copyright © 2016年 liuYuGang. All rights reserved.
//

#import "trendViewController.h"
#import "LineChartViewDemo.h"
#define CC_DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) * 0.01745329252f)
#define KlineHeight 20
#define KlineWidth 30

@interface trendViewController ()

@end

@implementation trendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];
    LineChartViewDemo* line = [[LineChartViewDemo alloc]
                               initWithFrame:CGRectMake(5, 100, 548, 340)];
    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
    //生成随机点   1
    //[pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth*0, 0)]];
    for (int i = 0; i < 12; i++) {
        [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth* (i+1), 5 * i)]];
    }
    NSMutableArray* pointArr2 = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {//生成随机点   2
        [pointArr2 addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth* (i + 1), 10 * i)]];
    }//竖轴
    NSMutableArray *vArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    for (int i=0; i<9; i++) {
        [vArr addObject:[NSString stringWithFormat:@"%d",i*20]];
    }//横轴
    NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    for (int i = 1; i <= 12; i++) {
        [hArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [line setHDesc:hArr];
    [line setVDesc:vArr];
    [line setArray:pointArr];
    [line setArray1:pointArr2];
    [self.view addSubview:line];

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
