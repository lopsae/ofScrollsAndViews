#import "OSVPinnedView.h"


@interface OSVPinnedView ()

@property (strong, nonatomic) UIView *pinnedView;

@end


@implementation OSVPinnedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}


- (void)addPinnedView:(UIView *)view
{
    self.pinnedView = view;
    [self addSubview:view];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect pinnedFrame = self.pinnedView.frame;
    pinnedFrame.origin.y = self.contentOffset.y;
    
    self.pinnedView.frame = pinnedFrame;
}


@end
