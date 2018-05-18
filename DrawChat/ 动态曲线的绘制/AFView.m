#import "AFView.h"
#import "AFDescribeObj.h"
@implementation AFView
{
    CGFloat w;
    CGFloat h;
}
@synthesize min_Y;
@synthesize max_Y;
@synthesize min_X;
@synthesize max_X;
@synthesize data;
@synthesize x_labels;
@synthesize y_labels;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        w = frame.size.width;
        h = frame.size.height;
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = w*0.05;
    }
    return self;
}

- (void)setData:(NSArray *)_data
{
    data = [NSArray arrayWithArray:_data];
    
    [self addAXis];

    CGFloat startTime = 2.0f;
    for (int i=1; i<data.count; i++)
    {
        CGPoint s = [data[i-1] CGPointValue];
        CGPoint e = [data[i] CGPointValue];
        
        s.x = (s.x - min_X)*0.8*w/(max_X - min_X) + 0.125*w;
        s.y = 0.875*h - (s.y - min_Y)*0.8*h/(max_Y - min_Y);
        e.x = (e.x - min_X)*0.8*w/(max_X - min_X) + 0.125*w;
        e.y = 0.875*h - (e.y - min_Y)*0.8*h/(max_Y - min_Y);
        
        AFDescribeObj *desObj = [[AFDescribeObj alloc]
                                 initWithType:AFAnimationStrokeEnd inView:self];
        [desObj setStartTime:startTime andDuration:0.5f];
        [desObj addLineFrom:s toPoint:e color:[UIColor whiteColor]];
        startTime += 0.5f;
    }
}

- (void)setX_labels:(NSArray *)_x_labels
{
    x_labels = [NSArray arrayWithArray:_x_labels];
    CGFloat num = ((CGFloat)x_labels.count)-1.0;
    CGFloat x_interval = 0.8*w/num;
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0.9*h, w, 0.1*h)];
    v.alpha = 0;
    
    for (int i=0; i<x_labels.count; i++)
    {
        NSString *str = x_labels[i];
        UILabel *label = [[UILabel alloc]
                          initWithFrame:CGRectMake(0.025*w+i*x_interval,
                                                   0, 0.2*w, 0.1*h)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:w/28.0];
        label.text = str;
        [v addSubview:label];
    }
    
    [self addSubview:v];
    [UIView animateWithDuration:1.5f
                     animations:^{
                         v.alpha = 1;
                     }];
}

- (void)setY_labels:(NSArray *)_y_labels
{
    y_labels = [NSArray arrayWithArray:_y_labels];
    CGFloat num = ((CGFloat)y_labels.count)-1.0;
    CGFloat y_interval = 0.8*h/num;
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.1*w, h)];
    v.alpha = 0;
    
    for (int i=0; i<y_labels.count; i++)
    {
        NSString *str = y_labels[i];
        UILabel *label = [[UILabel alloc]
                          initWithFrame:CGRectMake(0, 0.875*h - 6 - y_interval*i,
                                                   0.08*w, w/28.0+2)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:w/28.0];
        label.text = str;
        [v addSubview:label];
    }
    [self addSubview:v];
    [UIView animateWithDuration:1.5f
                     animations:^{
                         v.alpha = 1;
                     }];
}

- (void)addAXis
{
    AFDescribeObj *axis = [[AFDescribeObj alloc]
                           initWithType:AFAnimationStrokeEnd inView:self];
    [axis setStartTime:0.0f andDuration:1.0f];
    [axis addLineFrom:CGPointMake(w*0.10, h*0.90)
              toPoint:CGPointMake(w*0.10, h*0.05)
                color:[UIColor blackColor]];
    [axis addLineFrom:CGPointMake(w*0.10, h*0.90)
              toPoint:CGPointMake(w*0.95, h*0.90)
                color:[UIColor blackColor]];
    
    AFDescribeObj *anchor = [[AFDescribeObj alloc]
                             initWithType:AFAnimationStrokeEnd inView:self];
    [anchor setStartTime:1.0f andDuration:0.5f];
    [anchor addLineFrom:CGPointMake(w*0.10, h*0.05)
                toPoint:CGPointMake(w*0.125, h*0.075)
                  color:[UIColor blackColor]];
    [anchor addLineFrom:CGPointMake(w*0.10, h*0.05)
                toPoint:CGPointMake(w*0.075, h*0.075)
                  color:[UIColor blackColor]];
    [anchor addLineFrom:CGPointMake(w*0.95,h*0.90)
                toPoint:CGPointMake(w*0.925, h*0.925)
                  color:[UIColor blackColor]];
    [anchor addLineFrom:CGPointMake(w*0.95,h*0.90)
                toPoint:CGPointMake(w*0.925, h*0.875)
                  color:[UIColor blackColor]];
}

@end
