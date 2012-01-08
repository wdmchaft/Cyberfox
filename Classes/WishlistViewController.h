//
//  FavoritePalattesViewController.h
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@class CyberfoxAppDelegate, WishlistServiceResult;

@interface WishlistViewController : UITableViewController <UIActionSheetDelegate>
{
	CyberfoxAppDelegate *appDelegate;
	WishlistServiceResult *selectedProduct;
}

- (void)sendEmail;

@end
