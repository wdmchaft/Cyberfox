//
//  ProductsTableViewCell.h
//  CyberfoxApp
//
//  Created by Dan Ross on 16/05/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProductTableViewCell : UITableViewCell {
@private
	UIView *contentView;
}

- (void)drawContentView:(CGRect)r; // subclasses should implement

@end
