#import "OSVSnappyView.h"



@implementation OSVSnappyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    _snappyWidth = 0;
    self.delegate = self;
    
    return self;
}



- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"velocity: %f,%f", velocity.x, velocity.y);
    
    CGFloat maxIndex = ceilf(self.contentSize.width / self.snappyWidth);
    CGFloat targetX = scrollView.contentOffset.x + velocity.x * 60.0;
    
    CGFloat targetIndex;
    if (velocity.x > 0) {
        targetIndex = ceil(targetX / self.snappyWidth) +1;
    } else if (velocity.x < 0) {
        targetIndex = floor(targetX / self.snappyWidth);
    } else {
        targetIndex = round(targetX / self.snappyWidth);
    }
    
    if (targetIndex < 0) {
        targetIndex = 0;
    }
    if (targetIndex > maxIndex) {
        targetIndex = maxIndex;
    }
    targetContentOffset->x = targetIndex * self.snappyWidth;
}



@end
