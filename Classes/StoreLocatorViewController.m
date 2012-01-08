//
//  ProductsViewController.m
//  StoreLocator
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "StoreLocatorViewController.h"
#import "CyberfoxAppDelegate.h"
#import "CyberfoxStoreLocator.h"
#import "CyberfoxStore.h"
#import "CFColor.h"
#import "StoreCell.h"

@implementation StoreLocatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if(storeLocator == nil)
	{
		storeLocator = [[CyberfoxStoreLocator alloc] initWithTableView:(UITableView *)self.view];
	}

	[self.navigationController setNavigationBarHidden:NO animated:YES];
	[self.navigationController.navigationBar setTintColor:[CFColor colorWithHexString:@"679488"]];
	self.view.backgroundColor = TTSTYLEVAR(tabTintColor);
	
//	[self.navigationController setNavigationBarHidden:NO animated:YES];
	
	// Add the image
//	UIImage *image = [UIImage imageNamed:@"NavBar.png"];
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//	imageView.opaque = NO;
//	[self.navigationItem setTitleView:imageView];
	
	// Set the color
//	[self.navigationController.navigationBar setTintColor:[CFColor colorWithHexString:@"005399"]];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
	if([storeLocator.stores count] == 0)
	{
		[storeLocator loadNearestStores];
	}
}


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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [storeLocator.stores count];
}


- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
	return 72;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"StoreCell";
    
    StoreCell *cell = (StoreCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[StoreCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    CyberfoxStore *store = (CyberfoxStore *)[storeLocator.stores objectAtIndex:indexPath.row];
	[cell setStore:store];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	selectedStore = (CyberfoxStore *)[storeLocator.stores objectAtIndex:indexPath.row];
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Would you like to call or view this store in Maps?"
								delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil
					   otherButtonTitles:@"Call", @"View in Maps", nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	
	//[actionSheet showInView:((CyberfoxAppDelegate *)[[UIApplication sharedApplication] delegate]).tbController.view];
	
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}


// Respond to the actionsheet choice
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *urlString = @"";
	
	if (buttonIndex == 0)
	{
		NSLog(@"Tel");
		urlString = [NSString stringWithFormat:@"tel://%@", selectedStore.phone];
	}
	else if(buttonIndex == 1)
	{
		NSLog(@"Map");
		NSString *myAddress = [NSString stringWithFormat:@"%@, %@, %@ %@", selectedStore.address, selectedStore.city, selectedStore.state, selectedStore.zip];
		myAddress =  [myAddress stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];	
		
		urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", myAddress];
	}
	
	if(![urlString isEqualToString:@""])
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
	}
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


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

