//
//  WishlistServiceResult.m
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "WishlistServiceResult.h"
#import "CyberfoxAppDelegate.h"
#import <sqlite3.h>


static sqlite3 *database = nil;
static sqlite3_stmt *deleteStmt = nil;
static sqlite3_stmt *addStmt = nil;

@implementation WishlistServiceResult

@synthesize productID;
@synthesize mainProductName, mainProductDesc, mainProductImage, mainProductPrice;

- (id) init
{
	mainProductName = [[NSMutableString alloc] init];
	mainProductDesc = [[NSMutableString alloc] init];
	mainProductImage = [[NSMutableString alloc] init];
	mainProductPrice = [[NSMutableString alloc] init];
	
	return self;	
}

- (id) initWithId:(NSInteger *)newID
{
	if(self = [self init])
	{
		productID = newID;	
	}
	
	return self;
}


- (void) addToWishlist
{
	if(addStmt == nil)
	{
		const char *sql = "insert into wishlist (product_name, product_description, product_image, product_price) Values (?, ?, ?, ?)";
		if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	}
	
	sqlite3_bind_text(addStmt, 1, [mainProductName UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(addStmt, 2, [mainProductDesc UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(addStmt, 3, [mainProductImage UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(addStmt, 4, [mainProductPrice UTF8String], -1, SQLITE_TRANSIENT);
	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	else
		//SQLite provides a method to get the last primary key inserted by using sqlite3_last_insert_rowid
		productID = sqlite3_last_insert_rowid(database);
	
	//Reset the add statement.
	sqlite3_reset(addStmt);
}


- (void) deleteFromWishlist
{
	if(deleteStmt == nil)
	{
		const char *sql = "delete from wishlist where id = ?";
		if(sqlite3_prepare_v2(database, sql, -1, &deleteStmt, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating delete statement. '%s'", sqlite3_errmsg(database));
	}
	
	//When binding parameters, index starts from 1 and not zero.
	sqlite3_bind_int(deleteStmt, 1, productID);
	
	if (SQLITE_DONE != sqlite3_step(deleteStmt))
		NSAssert1(0, @"Error while deleting. '%s'", sqlite3_errmsg(database));
	
	sqlite3_reset(deleteStmt);
}


+ (void) getInitialDataToDisplay:(NSString *)dbPath
{
	CyberfoxAppDelegate *appDelegate = (CyberfoxAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
		const char *sql = "select id, product_name, product_description, product_image, product_price from wishlist";
		sqlite3_stmt *selectstmt;
		if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(selectstmt) == SQLITE_ROW)
			{
/*				NSInteger primaryKey = sqlite3_column_int(selectstmt, 0);
				WishlistServiceResult *newWish = [[WishlistServiceResult alloc] initWithId:primaryKey];

				newWish.mainProductName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
				newWish.mainProductDesc = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
				newWish.mainProductImage = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)];
				newWish.mainProductPrice = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)];
				
				[appDelegate.wishlist addObject:newWish];
				[newWish release]; */
			}
		}
	}
	else
		sqlite3_close(database); //Even though the open call failed, close the database connection to release all the memory.*/
}


+ (void) finalizeStatements
{	
	if(database) sqlite3_close(database);
	if(deleteStmt) sqlite3_finalize(deleteStmt);
	if(addStmt) sqlite3_finalize(addStmt);
}

@end
