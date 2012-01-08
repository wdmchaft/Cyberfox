//
//  FavoritePalattesViewController.m
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "WishlistViewController.h"
#import "CyberfoxAppDelegate.h"
#import "WishlistServiceResult.h"
#import "WishlistCell.h"
#import "CFColor.h"

@implementation WishlistViewController

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
	 
	appDelegate = (CyberfoxAppDelegate *)[[UIApplication sharedApplication] delegate];

    self.title = @"Wishlist";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.view.backgroundColor = TTSTYLEVAR(tabTintColor);
	
	// Add the image
	//UIImage *image = [UIImage imageNamed:@"NavBar.png"];
	//UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	//imageView.opaque = NO;
	//[self.navigationItem setTitleView:imageView];
	
	// Set the color
	[self.navigationController.navigationBar setTintColor:[CFColor colorWithHexString:@"679488"]];
	
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
/*    return [appDelegate.wishlist count]; */
}


- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
	return 72;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *CellIdentifier = @"Cell";
    
    WishlistCell *cell = (WishlistCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[WishlistCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
/*    WishlistServiceResult *thisColor = (WishlistServiceResult *)[appDelegate.wishlist objectAtIndex:indexPath.row];
	
	[cell setProduct:thisColor]; */

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
/*    selectedProduct = (WishlistServiceResult *)[appDelegate.wishlist objectAtIndex:indexPath.row];
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Would you like to e-mail this palette?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail", nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	
	[actionSheet showInView:((CyberfoxAppDelegate *)[[UIApplication sharedApplication] delegate]).tbController.view];
	
	[tableView deselectRowAtIndexPath:indexPath animated:NO]; */
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		[self sendEmail];
	}
}

- (void)sendEmail
{	
	NSString *to = @"";
	NSString *subject = @"Your friend has sent you color ideas from Cyberfox-Williams";
	NSString *body = [NSString stringWithFormat:@"Your friend wanted to send you this color : %@ - %@ and its coordinating colors : %@ - %@ and %@ - %@", selectedProduct.mainProductName, selectedProduct.mainProductPrice];
	
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body  stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
	{
//        WishlistServiceResult *thisProduct = (WishlistServiceResult *)[appDelegate.wishlist objectAtIndex:indexPath.row];
//		[appDelegate deleteWishlistProduct:thisProduct];
//		[tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

