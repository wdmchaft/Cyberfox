//
//  SelectionViewController.m
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "ProductDetailViewController.h"
#import "CFColor.h"

@implementation ProductDetailViewController

@synthesize imageView, userImage, savedProduct, colorUtility;
@synthesize tableDataSource;
@synthesize CurrentTitle;
@synthesize CurrentLevel;

- (id)initWithDictionary:(NSDictionary *)dict {
	
	self = [super init];
	
	if (self) {
		
		self.title = @"Details";
		self.detailDictionary = dict;
		self.categories = [[dict valueForKey:@"category"] componentsSeparatedByString:@", "];
		
		[[self navigationItem] setLeftBarButtonItem:[[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(backButton:)] autorelease]];
		
		categoryPosition = 0;
	}
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	savedProduct = @"FFFFFF";
	
	// Create the outer magnifier image
//	UIImage *tempImage = [UIImage imageNamed:@"Magnifier.png"];
//	magImage = [[UIImageView alloc] initWithImage:tempImage];
//	magImage.hidden = YES;
//	magImage.opaque = YES;
//	[self.view addSubview:magImage];
	
	// Create the color square
//	colorSquare = [[UIView alloc] init];
//	colorSquare.hidden = YES;
//	[self.view addSubview:colorSquare];
	
	// Create the color view in the nav bar
//	navBarColor = [[UIView alloc] init];
//	navBarColor.frame = CGRectMake(0, 0, 50, 30);
//	navBarColor.backgroundColor = [UIColor whiteColor];
//	[self.navigationItem setTitleView:navBarColor];
	
	// Set the color
	//[self.navigationController.navigationBar setTintColor:[CFColor colorWithHexString:@"679488"]];
	
}


- (void)viewWillAppear:(BOOL)animated
{
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	
	UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(showNextView)];
	self.navigationItem.rightBarButtonItem = buttonItem;
	[buttonItem release];
	
	if(isFirstTime)
	{
		UIAlertView *instructions = [[UIAlertView alloc] initWithTitle:@"Instructions"
														message:@"Move your finger around the image to pick a color.  Then click Continue to see the matching Cyberfox Williams colors."
															 delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[instructions show];
		[instructions release];
	}
	
	isFirstTime = NO;
}


- (void)viewDidAppear:(BOOL)animated
{
	if(self.userImage != nil)
	{
		self.imageView.image = self.userImage;
		self.imageView.bounds = CGRectMake(0, 0, self.userImage.size.width, self.userImage.size.height);
		
		self.colorUtility = [[CFColor alloc] initWithImage:self.imageView.image];
	}
}


- (void) setImage:(UIImage *)img
{
	self.userImage = img;
}

- (void) setFirstTime:(BOOL)answer
{
	isFirstTime = answer;	
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	CGPoint touchPoint = [touch locationInView:imageView];
	CGPoint realPoint = [touch locationInView:self.view];
	
	if(touchPoint.x < imageView.bounds.size.width && touchPoint.x > 0 && touchPoint.y < imageView.bounds.size.height && touchPoint.y > 0)
	{
		self.savedProduct = [colorUtility colorAtX:floor(touchPoint.x) y:floor(touchPoint.y)];
		
		//NSLog(savedColor);
		
		UIColor *newColor = [CFColor colorWithHexString:self.savedProduct];
		[navBarColor setBackgroundColor:newColor];
		
		[self showMagnifierAtPoint:realPoint.x y:realPoint.y];
	}
	else
	{
		[self hideMagnifier];
	}
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	CGPoint touchPoint = [touch locationInView:imageView];
	CGPoint realPoint = [touch locationInView:self.view];
	
	if(touchPoint.x < imageView.bounds.size.width && touchPoint.x > 0 && touchPoint.y < imageView.bounds.size.height && touchPoint.y > 0)
	{
		self.savedProduct = [colorUtility colorAtX:floor(touchPoint.x) y:floor(touchPoint.y)];
		
		//NSLog(savedColor);
		
		UIColor *newColor = [CFColor colorWithHexString:self.savedProduct];
		[navBarColor setBackgroundColor:newColor];
		
		[self showMagnifierAtPoint:realPoint.x y:realPoint.y];
	}
	else
	{
		[self hideMagnifier];
	}
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self hideMagnifier];
}


- (void)showMagnifierAtPoint:(CGFloat)x y:(CGFloat)y
{
	CGFloat realX = x - 25;
	CGFloat realY = y - 95;
	
	magImage.frame = CGRectMake(realX, realY, 50, 70);
	colorSquare.frame = CGRectMake(realX + 1, realY + 1, 48, 48);
	
	colorSquare.backgroundColor = [CFColor colorWithHexString:self.savedProduct];
	
	magImage.hidden = NO;
	colorSquare.hidden = NO;
}


- (void)hideMagnifier
{
	colorSquare.hidden = YES;
	magImage.hidden = YES;
}


- (void) showNextView
{
//	ProductServiceViewController *nextView = [[ProductServiceViewController alloc] initWithNibName:@"ProductServiceViewController" bundle:[NSBundle mainBundle]];
//	[nextView loadColorData:self.savedProduct];
	
//	[self.navigationController pushViewController:nextView animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
