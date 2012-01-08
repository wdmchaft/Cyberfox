//
//  FastTableViewCell.h
//  CyberfoxApp
//
//  Created by Dan Ross on 3/5/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FastTableViewCell : UITableViewCell {
@private
	UIView *contentView;
}

- (void)drawContentView:(CGRect)r; // subclasses should implement

@end
