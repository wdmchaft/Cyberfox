//
//  RssParser.h
//  RSS
//
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RssParser : NSObject {
@private
	NSMutableDictionary *root;
	NSMutableDictionary *itemsDictionary;
	NSMutableArray *items;
	NSMutableData *webData;
	
	NSString *requestUrl;
	NSString *currentElement;
	BOOL success;
	BOOL loading;
	BOOL parsed;
	
	BOOL inItem;
	
	NSInteger callId;
	id parentDelegate;
	SEL onCompleteCallback;
}

- (id)init:(NSInteger)identifier;
- (void)parse:(NSString *)url withDelegate:(id)sender onComplete:(SEL)callback;
- (void)parseResponse;

- (NSDictionary *)getRoot;
- (NSArray *)getItems;
- (NSInteger)getId;

- (BOOL)isSuccessful;
- (BOOL)isLoading;
- (BOOL)isParsed;

@end
