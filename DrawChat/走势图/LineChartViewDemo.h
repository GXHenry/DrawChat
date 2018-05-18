
#import <UIKit/UIKit.h>

@interface LineChartViewDemo : UIView

//横竖轴距离间隔
@property (assign) NSInteger hInterval;
@property (assign) NSInteger vInterval;

//横竖轴显示标签
@property (nonatomic, strong) NSArray *hDesc;
@property (nonatomic, strong) NSArray *vDesc;

//点信息
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) NSArray* array1;


@end
