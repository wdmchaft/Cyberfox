//
//  CyberfoxStoreLocator.h
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class CyberfoxStore;

@interface CyberfoxStoreLocator : NSObject <CLLocationManagerDelegate>
{
	NSMutableArray *stores;
	CLLocationManager *locationManager;
	NSXMLParser *xmlParser;
	NSMutableArray *zips;
	NSString *currentElement;
	NSMutableString *tempZip;
	CyberfoxStore *tempStore;
	BOOL hasSentZipUpdate;
	
	NSMutableData *webData;
	NSMutableString *soapResults;
	
	UITableView *tableView;
	UIActionSheet *loadingSheet;
}

@property(nonatomic, retain) NSMutableArray *stores;
@property(nonatomic, retain) UITableView *tableView;

- (id) initWithTableView:(UITableView *)view;
- (void) loadNearestStores;
- (void) getZipByLocation:(CLLocation *)location;

@end
