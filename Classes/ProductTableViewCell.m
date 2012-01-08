//
//  ProductsTableViewCell.m
//  CyberfoxApp
//
//  Created by Dan Ross on 16/05/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import "ProductTableViewCell.h"


@interface ProductTableViewCellView : UIView

@end

@implementation ProductTableViewCellView

- (void) drawRect:(CGRect)r {
	
	[(ProductTableViewCell *)[self superview] drawContentView:r];
}

@end

@implementation ProductTableViewCell

- (id) initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		
		contentView = [[ProductTableViewCellView alloc] initWithFrame:CGRectZero];
		contentView.opaque = YES;
		
		[self addSubview:contentView];
		[contentView release];
    }
    return self;
}

- (void) setFrame:(CGRect)f {
	
	[super setFrame:f];
	CGRect b = [self bounds];
	b.size.height -= 1; // leave room for the seperator line
	[contentView setFrame:b];
}

- (void) setNeedsDisplay {
	
	[super setNeedsDisplay];
	[contentView setNeedsDisplay];
}

- (void) drawContentView:(CGRect)r {
	
	// subclasses should implement this
}

- (void)dealloc {
	
    [super dealloc];
}


@end
