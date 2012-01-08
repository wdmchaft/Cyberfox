//
//  FavoriteProductCell.h
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@class WishlistServiceResult;

@interface WishlistCell : UITableViewCell
{
	WishlistServiceResult *product;
	UILabel *topLabel;
	UILabel *bottomLabel;
	UIView *mainProductView;
}

@property (nonatomic, retain) UILabel *topLabel;
@property (nonatomic, retain) UILabel *bottomLabel;
@property (nonatomic, retain) UIView *mainProductView;

- (void) setProduct:(WishlistServiceResult *)cellProduct;
- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold;

@end
