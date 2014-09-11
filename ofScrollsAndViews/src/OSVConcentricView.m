#import "OSVConcentricView.h"

@implementation OSVConcentricView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor lightGrayColor];
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // Concentric circles
    CGPoint boundsCenter;
    boundsCenter.x = bounds.origin.x + bounds.size.width/2;
    boundsCenter.y = bounds.origin.y + bounds.size.height/2;
    
    CGFloat largestRadius = powf(bounds.origin.x - boundsCenter.x, 2) + powf(bounds.origin.y - boundsCenter.y, 2);
    largestRadius = sqrtf(largestRadius);
    
    UIBezierPath *circlesPath = [UIBezierPath new];
    for (CGFloat currentRadius = 10; currentRadius < largestRadius; currentRadius += 30) {
        [circlesPath moveToPoint:CGPointMake(boundsCenter.x + currentRadius, boundsCenter.y)];
        [circlesPath addArcWithCenter:boundsCenter radius:currentRadius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    }
    
    circlesPath.lineWidth = 10;
    [[UIColor darkGrayColor] setStroke];
    [circlesPath stroke];
    
    // View border
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRect:bounds];
    borderPath.lineWidth = 10;
    [[UIColor redColor] setStroke];
    [borderPath stroke];
}

@end
