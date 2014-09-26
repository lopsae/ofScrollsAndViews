#import "OSVConnectedView.h"



@interface OSVConnectedView()

@property (strong, nonatomic) NSMutableArray *connectedViews;

@end



@implementation OSVConnectedView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    _connectedViews = [NSMutableArray new];
    self.delegate = self;
    
    return self;
}



- (void)connectView:(OSVConnectedView *)connectedView
{
    [self.connectedViews addObject:connectedView];
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    if (self.isDragging || self.isDecelerating) {
        for (OSVConnectedView *connectedView in self.connectedViews) {
            CGPoint newContentOffset = connectedView.contentOffset;
            newContentOffset.y = self.contentOffset.y;
            connectedView.contentOffset = newContentOffset;
            NSLog(@"layoutSubviews called %p, %d,%d", connectedView, (int) newContentOffset.x, (int)newContentOffset.y);
        }
    }
    
    if (!self.connectedViews.count) {
        NSLog(@"layoutSubviews also called for connected movement");
    }
}



@end
