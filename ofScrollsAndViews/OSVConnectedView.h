#import <UIKit/UIKit.h>



@interface OSVConnectedView : UIScrollView

/**
 * Array of connected views expected to contain UIScrollViews. When scrolling
 * all connected view's contentOffset will be set to match that one of the view
 * being scrolled. If the instance itself is present in the array it is ignored.
 */
@property (strong, nonatomic) NSArray *connectedViews;

@end
