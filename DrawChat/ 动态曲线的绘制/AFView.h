#import <UIKit/UIKit.h>

@interface AFView : UIView
@property (nonatomic) CGFloat min_X;
@property (nonatomic) CGFloat min_Y;
@property (nonatomic) CGFloat max_X;
@property (nonatomic) CGFloat max_Y;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *x_labels;
@property (nonatomic, strong) NSArray *y_labels;
@end
