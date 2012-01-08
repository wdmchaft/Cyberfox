//
//  CyberfoxAppAppDelegate.h
//  CyberfoxApp
//
//  Created by Dan Ross on 2/23/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@interface CyberfoxAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
	
    UIWindow *window;
    UITabBarController *tbController;
//	NSMutableArray *wishlist;
//	NSDictionary *data;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tbController;
//@property (nonatomic, retain) NSMutableArray *wishlist;
//@property (nonatomic, retain) NSDictionary *data;

+ (void) increaseNetworkActivityIndicator;
+ (void) decreaseNetworkActivityIndicator;

@end

