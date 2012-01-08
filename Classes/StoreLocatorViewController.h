//
//  ProductsViewController.h
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@class CyberfoxStoreLocator, CyberfoxStore;

@interface StoreLocatorViewController : UITableViewController <UIActionSheetDelegate>
{
	CyberfoxStoreLocator *storeLocator;
	CyberfoxStore *selectedStore;
}

@end
