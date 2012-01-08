//
//  CyberfoxStore.h
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <Foundation/Foundation.h>


@interface CyberfoxStore : NSObject
{
	NSMutableString *name;
	NSMutableString *address;
	NSMutableString *city;
	NSMutableString *state;
	NSMutableString *zip;
	NSMutableString *phone;
}

@property(nonatomic, retain) NSMutableString *name;
@property(nonatomic, retain) NSMutableString *address;
@property(nonatomic, retain) NSMutableString *city;
@property(nonatomic, retain) NSMutableString *state;
@property(nonatomic, retain) NSMutableString *zip;
@property(nonatomic, retain) NSMutableString *phone;

@end
