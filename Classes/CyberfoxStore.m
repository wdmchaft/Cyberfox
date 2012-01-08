//
//  CyberfoxStore.m
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "CyberfoxStore.h"


@implementation CyberfoxStore

@synthesize name, address, city, state, zip, phone;

-(id) init
{
	if(self = [super init])
	{
		name = [[NSMutableString alloc] init];
		address = [[NSMutableString alloc] init];
		city = [[NSMutableString alloc] init];
		state = [[NSMutableString alloc] init];
		zip = [[NSMutableString alloc] init];
		phone = [[NSMutableString alloc] init];
	}
	
	return self;
}

@end
