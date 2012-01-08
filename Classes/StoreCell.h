//
//  StoreCell.h
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@class CyberfoxStore;

@interface StoreCell : UITableViewCell
{
	CyberfoxStore *store;
	UILabel *topLabel;
	UILabel *bottomLabel;
}

@property (nonatomic, retain) UILabel *topLabel;
@property (nonatomic, retain) UILabel *bottomLabel;

- (void) setStore:(CyberfoxStore *)cellStore;
- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold;

@end
