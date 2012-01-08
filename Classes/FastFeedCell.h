//
//  FastFeedCell.h
//  Simple RSS
//
//  Created by Dan Ross on 3/24/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FastTableViewCell.h"


@interface FastFeedCell : FastTableViewCell {
@private
	NSString *mainText;
	NSString *subText;
	BOOL markedRead;
}

@property (nonatomic,retain) NSString *mainText;
@property (nonatomic,retain) NSString *subText;

- (void)setMainLabel:(NSString *)label;
- (void)setSubLabel:(NSString *)label;
- (void)setMarkedRead:(BOOL)yesOrNo;

@end
