//
//  SelectionViewController.h
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import <UIKit/UIKit.h>

@class CFColor;

@interface ProductDetailViewController : UIViewController {
@private
    IBOutlet UIImageView *imageView;
	UIImage *userImage;
	NSString *savedProduct;
	CFColor *colorUtility;
	UIView *colorSquare;
	UIImageView *magImage;
	UIView *currentColorView;
	
	BOOL isFirstTime;
	UIView *navBarColor;

	NSArray *tableDataSource;
	NSString *CurrentTitle;
	NSInteger CurrentLevel;
	IBOutlet UITabBarController *tbController;


	NSDictionary *detailDictionary;
	NSArray *categories;
	UILabel *categoryLabel;
	NSTimer *categoryLabelTimer;
	int categoryPosition;
}

@property (nonatomic, retain) NSDictionary *detailDictionary;
@property (nonatomic, retain) NSArray *categories;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) UIImage *userImage;
@property (nonatomic, retain) NSString *savedProduct;
@property (nonatomic, retain) CFColor *colorUtility;
@property (nonatomic, retain) NSArray *tableDataSource;
@property (nonatomic, retain) NSString *CurrentTitle;
@property (nonatomic, readwrite) NSInteger CurrentLevel;

- (id)initWithDictionary:(NSDictionary *)dict;

- (void) setImage:(UIImage *)img;
- (void) showNextView;
- (void) setFirstTime:(BOOL)answer;

- (void)showMagnifierAtPoint:(CGFloat)x y:(CGFloat)y;
- (void)hideMagnifier;

@end
