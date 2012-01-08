//
//  WishlistServiceResult.h
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <Foundation/Foundation.h>

/*
 * ah : hex of 1st coordinating color
 * ai
 * am : Cyberfox # of 1st coordinating color
 * an : Name of 1st coordinating color
 * au : usage of 1st coordinating color
 * familyName : family of matching color
 * ph : hex of matching color
 * pi
 * pm : Cyberfox # of matching color
 * pn : Name of matching color
 * pu : usage of matching color
 * schemeId : coord scheme id
 * schemeUsage : coord scheme usage
 * th : hex of 2nd coordinating color
 * ti
 * tm : Cyberfox # of 2nd coordinating color
 * tn : Name of 2nd coordinating color
 * tu : usage of 2nd coordinating color
*/

@interface WishlistServiceResult : NSObject
{
	NSInteger *productID;

	NSMutableString *mainProductName;
	NSMutableString *mainProductDesc;
	NSMutableString *mainProductImage;
	NSMutableString *mainProductPrice;
}

@property (nonatomic, readonly) NSInteger *productID;

@property (nonatomic, copy) NSMutableString *mainProductName;
@property (nonatomic, copy) NSMutableString *mainProductDesc;
@property (nonatomic, copy) NSMutableString *mainProductImage;
@property (nonatomic, copy) NSMutableString *mainProductPrice;

- (id) initWithId:(NSInteger *)newID;

- (void) addToWishlist;
- (void) deleteFromWishlist;

+ (void) getInitialDataToDisplay:(NSString *)dbPath;
+ (void) finalizeStatements;

@end
