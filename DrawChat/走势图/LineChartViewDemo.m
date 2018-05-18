
#import "LineChartViewDemo.h"
#import "EColumnChartLabel.h"
#define KlineHeight 30

@interface LineChartViewDemo()
{
    CALayer *linesLayer;
    
    
    UIView *popView;
    UILabel *disLabel;
    
    int x;
    int y;
    
}

@end

@implementation LineChartViewDemo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        x = frame.size.width;
        y = frame.size.height;
        
        
        _hInterval = 10;
        _vInterval = 50;
        
        linesLayer = [[CALayer alloc] init];
        linesLayer.masksToBounds = YES;
        linesLayer.contentsGravity = kCAGravityLeft;
        linesLayer.backgroundColor = [[UIColor redColor] CGColor];
        
        //[self.layer addSublayer:linesLayer];
        
        
        //PopView
        popView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        [popView setBackgroundColor:[UIColor whiteColor]];
        [popView setAlpha:0.0f];
        
        disLabel = [[UILabel alloc]initWithFrame:popView.frame];
        [disLabel setTextAlignment:NSTextAlignmentCenter];
        
        [popView addSubview:disLabel];
        [self addSubview:popView];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    [self setClearsContextBeforeDrawing: YES];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画背景线条------------------
    CGColorRef backColorRef = [UIColor redColor].CGColor;
    CGFloat backLineWidth = 0.5f;
    CGFloat backMiterLimit = 0.f;
    
    CGContextSetLineWidth(context, backLineWidth);//主线宽度
   // CGContextSetMiterLimit(context, backMiterLimit);//投影角度
    
    //CGContextSetShadowWithColor(context, CGSizeMake(3, 5), 8, backColorRef);//设置双条线
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextSetLineCap(context, kCGLineCapRound );
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
   // CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:225.0f / 255.0f green:225.0f / 255.0f blue:225.0f / 255.0f alpha:1.0].CGColor);
    
//    int x = 400 ;
//    //Y轴横线
//    int y = 300 ;
    int tempY = y;
    
    
    //添加纵轴标签和线
    for (int i=0; i<_vDesc.count; i++) {
        
        CGPoint bPoint = CGPointMake(30, tempY);
        CGPoint ePoint = CGPointMake(x, tempY);
        
        EColumnChartLabel *label = [[EColumnChartLabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [label setCenter:CGPointMake(bPoint.x-15, bPoint.y-30)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor blackColor]];
        [label setText:[_vDesc objectAtIndex:i]];
        [self addSubview:label];
        
        CGContextMoveToPoint(context, bPoint.x, bPoint.y-30);
        CGContextAddLineToPoint(context, ePoint.x, ePoint.y-30);
        
        tempY -= y * 0.1;
        
    }
    
    for (int i=0; i<_array.count-1; i++) {
        
        EColumnChartLabel *label = [[EColumnChartLabel alloc]initWithFrame:CGRectMake(i*KlineHeight+30, y - 30, 40, 30)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor redColor]];
        label.numberOfLines = 1;
        label.adjustsFontSizeToFitWidth = YES;
        label . minimumFontSize = 1.0f;
        [label setText:[_hDesc objectAtIndex:i]];
        
        [self addSubview:label];
    }
    CGContextStrokePath(context);

    
    
    //    //画点线条------------------
    CGColorRef pointColorRef = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0].CGColor;
    CGFloat pointLineWidth = 1.5f;
    CGFloat pointMiterLimit = 5.0f;
    
    CGContextSetLineWidth(context, pointLineWidth);//主线宽度
    CGContextSetMiterLimit(context, pointMiterLimit);//投影角度
    
    
    //CGContextSetShadowWithColor(context, CGSizeMake(3, 5), 8, pointColorRef);//设置双条线
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextSetLineCap(context, kCGLineCapRound );
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    //CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    UIColor* color1 = c_BeforeLastYear;
    [color1 set];

	//绘图
	CGPoint p1 = [[_array objectAtIndex:0] CGPointValue];
	int i = 0;
    
    //获取视图的高
    int tempY1 = y;
    int tempWidth = y * 0.1f;
    float tempHeight = y * (270.0 / 320.0);
    float tempHeight1 = y * (20.0f / 320.0f);
 //   NSLog(@"%f");
	CGContextMoveToPoint(context, p1.x + 20, tempHeight-p1.y*tempWidth/tempHeight1);
	for (; i<[_array count]; i++)
	{
		p1 = [[_array objectAtIndex:i] CGPointValue];
        CGPoint goPoint = CGPointMake(p1.x + 20, tempHeight-p1.y*tempWidth/tempHeight1);
		CGContextAddLineToPoint(context, goPoint.x, goPoint.y);;
        
        //添加触摸点
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [bt setBackgroundColor:[UIColor redColor]];
        
        [bt setFrame:CGRectMake(0, 0, 10, 10)];
        
        [bt setCenter:goPoint];
        
        [bt addTarget:self
               action:@selector(btAction:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:bt];
	}
    CGContextStrokePath(context);

    
   // CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    UIColor* color = c_LastYear;
    [color set];
    //绘图
	 p1 = [[_array1 objectAtIndex:0] CGPointValue];
	 i = 0;
	CGContextMoveToPoint(context, p1.x + 20, tempHeight-p1.y*tempWidth/tempHeight1);
	for (; i<[_array1 count]; i++)
	{
		p1 = [[_array1 objectAtIndex:i] CGPointValue];
        CGPoint goPoint = CGPointMake(p1.x + 20, tempHeight-p1.y*tempWidth/tempHeight1);
		CGContextAddLineToPoint(context, goPoint.x, goPoint.y);;
        
        //添加触摸点
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [bt setBackgroundColor:[UIColor redColor]];
        
        [bt setFrame:CGRectMake(0, 0, 10, 10)];
        
        [bt setCenter:goPoint];
        
        [bt addTarget:self
               action:@selector(btAction:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:bt];
	}

	CGContextStrokePath(context);
    
    
    
    
    
    
    

}
- (void)btAction:(id)sender{
    [disLabel setText:@"400"];
    
    UIButton *bt = (UIButton*)sender;
    popView.center = CGPointMake(bt.center.x, bt.center.y - popView.frame.size.height/2);
    [popView setAlpha:1.0f];
}

@end
