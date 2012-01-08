//
//  NavigationRotateController.m
//  CyberfoxApp
//
//  Created by Dan Ross on 18/05/10.
//  Copyright © 2010 Natio Pty. Ltd. All rights reserved.
//

#import "NavigationRotateController.h"

@implementation NavigationRotateController

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if([self.parentViewController class] == [UITabBarController class] && 
	   ((UITabBarController*)self.parentViewController).selectedViewController != self)
		return YES;
	return [self.topViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (id) initWithRootViewController:(UIViewController *)rootViewController
{
	self = [super initWithRootViewController:rootViewController];
	if(self)
	{
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountChanged:) name:@"AccountChanged" object:nil];
	}
	
	return self;
}

- (void) accountChanged:(NSNotification*)notification
{
	[self popToRootViewControllerAnimated:NO];
}


@end

@implementation TabBarRotateController

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end
