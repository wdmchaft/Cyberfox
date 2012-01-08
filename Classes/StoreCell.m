//
//  StoreCell.m
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "StoreCell.h"
#import "CyberfoxStore.h"

@implementation StoreCell

@synthesize topLabel, bottomLabel;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])
	{
		UIView *contentView = self.contentView;

		self.topLabel = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor blackColor] fontSize:20.0 bold:NO];
		[contentView addSubview:self.topLabel];
		
		
		self.bottomLabel = [self newLabelWithPrimaryColor:[UIColor darkGrayColor] selectedColor:[UIColor darkGrayColor] fontSize:12.0 bold:NO];
		[contentView addSubview:self.bottomLabel];
    }
    return self;
}


- (void) setStore:(CyberfoxStore *)cellStore
{
	store = cellStore;
	
	topLabel.text = store.name;
	bottomLabel.text = [NSString stringWithFormat:@"%@, %@, %@ %@", store.address, store.city, store.state, store.zip];
}


- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold
{
    //UIFont *font = [UIFont fontWithName:@"Helvetica" size:fontSize];
	UIFont *font = [UIFont systemFontOfSize:fontSize];
	
	UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	newLabel.backgroundColor = [UIColor clearColor];
	newLabel.opaque = NO;
	newLabel.textColor = primaryColor;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
	
	return newLabel;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
	
	// getting the cell size
    CGRect contentRect = self.contentView.bounds;
	
    if (!self.editing)
	{
		// Get the base point
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
		
		frame = CGRectMake(boundsX + 30, 16, 270, 24);
		self.topLabel.frame = frame;
		
		frame = CGRectMake(boundsX + 30, 42, 270, 14);
		self.bottomLabel.frame = frame;
	}
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
