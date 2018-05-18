//
//  DrawLineViewController.m
//  各种曲线折线的绘制
//
//  Created by Apple on 16/4/20.
//  Copyright © 2016年 liuYuGang. All rights reserved.
//

#import "DrawLineViewController.h"
#import "Canvas.h"
@interface DrawLineViewController ()

@end

@implementation DrawLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];
        //添加画布类
    Canvas *canvas = [[Canvas alloc] initWithFrame:
                      CGRectMake(0, 100, self.view.bounds.size.width,
                                 self.view.bounds.size.height)];
    [self.view addSubview:canvas];
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
