//
//  FavoriteProductCell.m
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "WishlistCell.h"
#import "WishlistServiceResult.h"
#import "CFColor.h"


@implementation WishlistCell

@synthesize topLabel, bottomLabel, mainProductView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])
	{
		UIView *contentView = self.contentView;
		
		self.topLabel = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor blackColor] fontSize:20.0 bold:NO];
		[contentView addSubview:self.topLabel];
		
		self.bottomLabel = [self newLabelWithPrimaryColor:[UIColor darkGrayColor] selectedColor:[UIColor darkGrayColor] fontSize:12.0 bold:NO];
		[contentView addSubview:self.bottomLabel];
		
		self.mainProductView = [[UIView alloc] init];
		[contentView addSubview:self.mainProductView];
    }
    return self;
}


- (void) setProduct:(WishlistServiceResult *)cellProduct
{
	product = cellProduct;
	
	topLabel.text = [NSString stringWithFormat:@"%@ - %@", product.mainProductName, product.mainProductPrice];
	bottomLabel.text = [NSString stringWithFormat:@"%@ and %@", product.mainProductDesc, product.mainProductImage];
	
	[mainProductView setBackgroundColor:[CFColor colorWithHexString:product.mainProductImage]];
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
		
		frame = CGRectMake(boundsX + 80, 16, 270, 24);
		self.topLabel.frame = frame;
		
		frame = CGRectMake(boundsX + 80, 42, 270, 14);
		self.bottomLabel.frame = frame;
		
		frame = CGRectMake(10, 10, 52, 52);
		self.mainProductView.frame = frame;
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
