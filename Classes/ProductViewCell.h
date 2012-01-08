//
//  ProductViewCell.h
//  CyberfoxApp
//
//  Created by Dan Ross on 16/05/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import "ProductTableViewCell.h"


@interface ProductViewCell : ProductTableViewCell {
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
