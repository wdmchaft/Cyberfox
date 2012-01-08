//
//  CyberfoxAppAppDelegate.m
//  CyberfoxApp
//
//  Created by Dan Ross on 2/23/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import "CyberfoxAppDelegate.h"
#import "CyberfoxViewController.h"
#import "ProductViewController.h"
#import "WishlistServiceResult.h"
#import "WishlistViewController.h"
#import "StoreLocatorViewController.h"
#import "NavigationRotateController.h"
#import "FeedsViewController.h"
#import "MessagesViewController.h"
#import "SettingsViewController.h"
#import "AboutViewController.h"



static int NetworkActivityIndicatorCounter = 0;

@implementation CyberfoxAppDelegate

@synthesize window;
@synthesize tbController;
//@synthesize wishlist;
//@synthesize data;

- (UINavigationController *) createNavControllerWrappingViewControllerOfClass:(Class)cntrloller 
																	 nibName:(NSString*)nibName 
																 tabIconName:(NSString*)iconName
																	tabTitle:(NSString*)tabTitle {
	
	UIViewController* viewController = [[cntrloller alloc] initWithNibName:nibName bundle:nil];
	NavigationRotateController *navController;
	navController = [[NavigationRotateController alloc] initWithRootViewController:viewController];
	viewController.tabBarItem.image = [UIImage imageNamed:iconName];
	viewController.title = NSLocalizedString(tabTitle, @""); 
	[viewController release];
	
	return navController;
}

- (void) setupPortraitUserInterface {
	
	UINavigationController *localNavigationController;
	
	NSMutableArray *localViewControllersArray = [[NSMutableArray alloc] initWithCapacity:4];
	
	localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[CyberfoxViewController class] nibName:nil tabIconName:@"home.png" tabTitle:@"Home"];
	[localViewControllersArray addObject:localNavigationController];
	[localNavigationController release];
	//if([MGTwitterEngine username] == nil) [LoginController showModeless:localNavigationController animated:NO];
	
	localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[FeedsViewController class] nibName:@"FeedsViewController" tabIconName:@"feeds.png" tabTitle:@"News"];
	[localViewControllersArray addObject:localNavigationController];
	[localNavigationController release];
	
	localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[ProductViewController class] nibName:@"ProductViewController" tabIconName:@"products.png" tabTitle:@"Products"];
	[localViewControllersArray addObject:localNavigationController];
	[localNavigationController release];
	
	localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[StoreLocatorViewController class] nibName:@"StoreLocatorViewController" tabIconName:@"store.png" tabTitle:@"Store"];
	[localViewControllersArray addObject:localNavigationController];
	[localNavigationController release];
	
	//localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[MessagesViewController class] nibName:nil tabIconName:@"messages.png" tabTitle:@"Messages"];
	//[localViewControllersArray addObject:localNavigationController];
	//[localNavigationController release];
	
	localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[SettingsViewController class] nibName:@"SettingsViewController" tabIconName:@"settings.png" tabTitle:@"Settings"];
	[localViewControllersArray addObject:localNavigationController];
	[localNavigationController release];
	
	localNavigationController = [self createNavControllerWrappingViewControllerOfClass:[AboutViewController class] nibName:@"AboutViewController" tabIconName:@"about.png" tabTitle:@"About"];
	[localViewControllersArray addObject:localNavigationController];
	[localNavigationController release];
	
	tbController.viewControllers = localViewControllersArray;
	
	[localViewControllersArray release];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	//[self copyDatabaseIfNeeded];
	
//	NSDictionary *appDefaults = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"defaults" ofType:@"plist"]];
//	[[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
	
//	[appDefaults release];
	
//	NSString *path = [NSString stringWithFormat:@"http://www.cyberfox.com.au/data.plist"];	
//	NSDictionary *tempDict = [[NSDictionary alloc] initWithContentsOfFile:[NSURL URLWithString:path]];
	
//	self.data = tempDict;
//	[tempDict release];
	
//	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//	self.wishlist = tempArray;
//	[tempArray release];
	
	//Once the db is copied, get the initial data to display on the screen.
	//[WishlistServiceResult getInitialDataToDisplay:[self getDBPath]];
	
	[self setupPortraitUserInterface];
	
	// Add the first view
    [window addSubview:tbController.view];
			
    [window makeKeyAndVisible];
}

/*
- (void) applicationDidReceiveMemoryWarning:(UIApplication*)application {
	
	[[TTStyleSheet globalStyleSheet] freeMemory];
	[[TTURLCache sharedCache] removeAll:NO];
}

- (void) addWishlistProduct:(WishlistServiceResult *)productResult {
	
	[productResult addToWishlist];
	[wishlist addObject:productResult];
//	[wvController.tableView reloadData];
}

- (void )deleteWishlistProduct:(WishlistServiceResult *)productResult {
	
	[productResult deleteFromWishlist];	
	[wishlist removeObject:productResult];
}


- (void)copyDatabaseIfNeeded {
	
	NSString *dbPath = [self getDBPath];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL success = [fileManager fileExistsAtPath:dbPath];
	
	NSError *error;
	
	if(!success)
	{
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Cyberfox.sqlite"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		
		if (!success) NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}
}
*/
/*
- (NSString *)getDBPath {
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	return [documentsDir stringByAppendingPathComponent:@"Cyberfox.sqlite"];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
//	[WishlistServiceResult finalizeStatements];	
}
*/

- (void)dealloc 
{
    [tbController release];
    [window release];
    [super dealloc];
}

+ (void) increaseNetworkActivityIndicator
{
	NetworkActivityIndicatorCounter++;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NetworkActivityIndicatorCounter > 0;
}

+ (void) decreaseNetworkActivityIndicator
{
	NetworkActivityIndicatorCounter--;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NetworkActivityIndicatorCounter > 0;
}

@end
