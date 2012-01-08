//
//  CyberfoxStoreLocator.m
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "CyberfoxStoreLocator.h"
#import <CoreLocation/CoreLocation.h>
#import "CyberfoxStore.h"


@implementation CyberfoxStoreLocator

@synthesize stores, tableView;

- (id) initWithTableView:(UITableView *)view
{
	if(self = [super init])
	{
		tableView = view;
		stores = [[NSMutableArray alloc] init];
	}
	
	return self;
}


- (void) loadNearestStores
{	
	NSLog(@"Loading");
	if(locationManager == nil)
	{
		locationManager = [[CLLocationManager alloc] init];
	}
	
	locationManager.delegate = self;
	locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
	locationManager.distanceFilter = 500;
	
	[locationManager startUpdatingLocation];
}

- (void) locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
	fromLocation:(CLLocation *)oldLocation
{
	if(loadingSheet == nil)
	{
		loadingSheet = [[UIActionSheet alloc] initWithTitle:@"Loading nearby stores" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
		loadingSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
		
		[loadingSheet showInView:tableView];
	}
	
    // If it's a relatively recent event, turn off updates to save power
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	
    if (abs(howRecent) < 5.0)
    {
        [manager stopUpdatingLocation];
		
        printf("latitude %+.6f, longitude %+.6f\n",
			   newLocation.coordinate.latitude,
			   newLocation.coordinate.longitude);
		
		[self getZipByLocation:newLocation];
    }	
}

- (void) getZipByLocation:(CLLocation *)location
{	
	hasSentZipUpdate = YES;
	
	if(xmlParser)
	{
		[xmlParser release];
	}
	
	zips = [[NSMutableArray alloc] init];
	
	//NSString *urlString = [NSString stringWithFormat:@"http://ws.geonames.org/findNearbyPostalCodes?lat=%.5f&lng=%.5f", location.coordinate.latitude, location.coordinate.longitude];
	//NSURL *zipsURL = [NSURL URLWithString:urlString];
	NSURL *zipsURL = [NSURL URLWithString:@"http://ws.geonames.org/findNearbyPostalCodes?lat=39.988114&lng=-83.042683"];
	
	xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:zipsURL];
	[xmlParser setDelegate:self];
	
	[xmlParser setShouldProcessNamespaces:NO];
	[xmlParser setShouldReportNamespacePrefixes:NO];
	[xmlParser setShouldResolveExternalEntities:NO];
	
	[xmlParser parse];
}

- (void)parser :( NSXMLParser *)parser didStartElement :( NSString *)elementName namespaceURI :( NSString *)namespaceURI qualifiedName :( NSString *)qName attributes :( NSDictionary *)attributeDict
{
	currentElement = [elementName copy];
	
	if ([elementName isEqualToString:@"postalcode"])
	{
		NSLog(@"start zip");
		tempZip = [[NSMutableString alloc] init];
	}
	else if([elementName isEqualToString:@"ns:return"])
	{
		NSLog(@"start store");
		tempStore = [[CyberfoxStore alloc] init];
	}
}

- (void)parser :( NSXMLParser *)parser didEndElement :( NSString *)elementName namespaceURI :( NSString *)namespaceURI qualifiedName :( NSString *)qName
{
	if ([elementName isEqualToString:@"postalcode"])
	{
		[zips addObject:[tempZip copy]];
		NSLog([NSString stringWithFormat:@"Found zip: %@", tempZip]);
	}
	else if([elementName isEqualToString:@"ns:return"])
	{
		[stores addObject:tempStore];
		NSLog([NSString stringWithFormat:@"Found store: %@", tempStore.name]);
	}
}

- (void)parser :( NSXMLParser *)parser foundCharacters :( NSString *)string
{
	if ([currentElement isEqualToString:@"postalcode"])
	{
		[tempZip appendString:string];
	}
	else if([currentElement isEqualToString:@"ax28:name"])
	{
		[tempStore.name appendString:string];
	}
	else if([currentElement isEqualToString:@"ax28:address"])
	{
		[tempStore.address appendString:string];
	}
	else if([currentElement isEqualToString:@"ax28:city"])
	{
		[tempStore.city appendString:string];
	}
	else if([currentElement isEqualToString:@"ax28:state"])
	{
		[tempStore.state appendString:string];
	}
	else if([currentElement isEqualToString:@"ax28:zip"])
	{
		[tempStore.zip appendString:string];
	}
	else if([currentElement isEqualToString:@"ax28:phone"])
	{
		[tempStore.phone appendString:string];
	}
}

- (void)parserDidEndDocument :( NSXMLParser *)parser
{
	if(hasSentZipUpdate == YES && [zips count] > 0)
	{
		hasSentZipUpdate = NO;
		
		NSLog(@"Sending SOAP Request");
		
		// Send the request to the Cyberfox store locator
//		NSString *soapMessage = [NSString stringWithFormat:
//								 @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
//								 "<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n"
//								 "<SOAP-ENV:Body>\n"
//								 "<ns1:getStoreData xmlns:ns1=\"http://cool.cyberfox.com.au\">\n"
//								 "<ns1:zipCode>%@</ns1:zipCode>\n"
//								 "</ns1:getStoreData>\n"
//								 "</SOAP-ENV:Body>\n"
//								 "</SOAP-ENV:Envelope>\n", [zips objectAtIndex:0]
//								 ];
		
		NSURL *url = [NSURL URLWithString:@"http://cyberfox.com.au/SOAP.xml"];
		NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//		NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
		
//		[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//		[theRequest addValue: @"urn:getStoreData" forHTTPHeaderField:@"SOAPAction"];
//		[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
//		[theRequest setHTTPMethod:@"POST"];
//		[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
		
		NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		if( theConnection )
		{
			webData = [[NSMutableData data] retain];
		}
		else
		{
			NSLog(@"theConnection is NULL");
			[loadingSheet dismissWithClickedButtonIndex:3 animated:YES];
		}		
	}
	else if(hasSentZipUpdate == NO && [zips count] > 0 && [stores count] > 0)
	{
		// All stores have loaded
		[loadingSheet dismissWithClickedButtonIndex:3 animated:YES];
		[tableView reloadData];
	}
	else
	{
		[loadingSheet dismissWithClickedButtonIndex:3 animated:YES];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No stores were found near you" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK"];
		[alert show];
		[alert release];
	}
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength: 0];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"ERROR with theConenction");
	[loadingSheet dismissWithClickedButtonIndex:3 animated:YES];
	[connection release];
	[webData release];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if([stores count] == 0)
	{
		NSLog(@"DONE. Received Bytes: %d", [webData length]);
		NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
		NSLog(theXML);
		[theXML release];
		
		if( xmlParser )
		{
			[xmlParser release];
		}
		
		xmlParser = [[NSXMLParser alloc] initWithData: webData];
		[xmlParser setDelegate: self];
		[xmlParser setShouldResolveExternalEntities: YES];
		[xmlParser parse];
		
		[connection release];
		[webData release];
	}
}


@end
