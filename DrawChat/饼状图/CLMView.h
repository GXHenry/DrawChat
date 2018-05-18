#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface CLMView : UIView 
{
	float spaceHeight; //高度
	float scaleY ; 
	NSArray *titleArr ; //文字
	NSArray *valueArr; //值
	NSArray	*colorArr; //颜色
}

@property(nonatomic, assign)  float spaceHeight;
@property(nonatomic, assign) float scaleY;
@property(nonatomic, retain) NSArray *titleArr;
@property(nonatomic, retain) NSArray *valueArr;
@property(nonatomic, retain) NSArray *colorArr;

@end
