#import "OSVAppDelegate.h"
#import "OSVConcentricView.h"
#import "OSVPinnedView.h"
#import "OSVSnappyView.h"
#import "OSVConnectedView.h"

@implementation OSVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    
    int pages = 3;
    CGFloat verticalMultiplier = 2;
    
    // Create horizontal scroll view
    OSVSnappyView *horizontalScroll = [OSVSnappyView new];
    horizontalScroll.directionalLockEnabled = YES;
    
    // Create and add pages
    NSMutableArray *verticalViews = [NSMutableArray new];
    for (int index = 0; index < pages; index++) {
        CGRect pageFrame = CGRectMake(0, 0, bounds.size.width, bounds.size.height*verticalMultiplier);
        OSVConcentricView *pageView = [[OSVConcentricView alloc] initWithFrame:pageFrame];
        
        OSVConnectedView *verticalScroll = [OSVConnectedView new];
        verticalScroll.frame = CGRectMake(bounds.size.width * index, 0, bounds.size.width, bounds.size.height);
        
        [verticalScroll addSubview:pageView];
        verticalScroll.contentSize = CGSizeMake(bounds.size.width, pageFrame.size.height);
        
        [horizontalScroll addSubview:verticalScroll];
        [verticalViews addObject:verticalScroll];
    }
    
    // Hacky connections
    OSVConnectedView *firstVertical = [verticalViews firstObject];
    OSVConnectedView *secondVertical = verticalViews[1];
    [firstVertical connectView:verticalViews[1]];
    [secondVertical connectView:firstVertical];
    
    // Set pinned top view
    CGRect topViewFrame = CGRectMake(0, 0, bounds.size.width * 3, 30);
    OSVConcentricView *topView = [[OSVConcentricView alloc] initWithFrame:topViewFrame];
    [horizontalScroll addPinnedView:topView];
    
    // Set content size
    horizontalScroll.contentSize = CGSizeMake(bounds.size.width*pages, bounds.size.height);
    horizontalScroll.snappyWidth = bounds.size.width / 3;
    
    UIViewController *viewController = [UIViewController new];
    viewController.view = horizontalScroll;
    
    self.window.rootViewController = viewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
