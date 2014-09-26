#import "OSVConnectedView.h"



@interface OSVConnectedView()

@end



@implementation OSVConnectedView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    _connectedViews = [NSMutableArray new];
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.connectedViews) {
        return;
    }
    
    if (self.isDragging || self.isDecelerating) {
        for (UIScrollView *singleConnectedView in self.connectedViews) {
            if (singleConnectedView == self) {
                continue;
            }
            
            CGPoint newContentOffset = singleConnectedView.contentOffset;
            newContentOffset.y = self.contentOffset.y;
            singleConnectedView.contentOffset = newContentOffset;
        }
    } else {
        NSLog(@"connected being dragged %p, %d,%d", self, (int) self.contentOffset.x, (int)self.contentOffset.y);
    }
}



@end
