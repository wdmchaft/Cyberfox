//
//  ProductViewController.h
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@interface ProductViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	
@private
	
	IBOutlet UITabBarController *tbController;
	
	NSMutableArray *products;
	NSString *title;
	NSInteger level;
	
}

@property (nonatomic, retain) NSArray *products;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, readwrite) NSInteger level;

@end
