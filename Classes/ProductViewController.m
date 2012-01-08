//
//  ProductViewController.m
//  CyberfoxApp
//
//  Created by Dan Ross on 3/8/11.
//  Copyright © 2011 Natio Pty. Ltd. All rights reserved. 
//

#import "ProductDetailViewController.h"
#import "ProductViewController.h"
#import "ProductViewCell.h"
#import "CyberfoxAppDelegate.h"
#import "CFColor.h"

@implementation ProductViewController

@synthesize products, title, level;

- (void)viewDidLoad {
	
    [super viewDidLoad];

    if(level == 0) {
		
		NSArray *tempArray = [[NSArray alloc] init];
		self.products = tempArray;
		[tempArray release];
		
		CyberfoxAppDelegate *AppDelegate = (CyberfoxAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.products = [AppDelegate.data objectForKey:@"Rows"];

		self.navigationItem.title = @"Products";
	}
	else {
		
		self.navigationItem.title = title;
	}
	[self.tableView setBackgroundColor:TTSTYLEVAR(tabTintColor)];
	[self.navigationController.navigationBar setTintColor:[CFColor colorWithHexString:@"679488"]];
	[self.tableView setRowHeight:61];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSDictionary *dict = [self.products objectAtIndex:indexPath.row];
	ProductViewCell *cell = (ProductViewCell *) [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if (cell == nil) cell = [[[ProductViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"Cell"] autorelease];
	
	// Image
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.cyberfox.com.au/imgs/%@.png",[dict objectForKey:@"Image"]]];
	UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
	CGRect area = CGRectMake(2.0f, 2.0f, 56.0f, 56.0f);
		
	[image setBounds:area];
	[image setFrame:area];
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
	// Title
	[cell setMainLabel:[dict objectForKey:@"Title"]];
	
	// Description
	[cell setSubLabel:[dict objectForKey:@"Description"]];
	
	// Add to cell
	[cell addSubview:image];
	
	//[image release];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSDictionary *dict = [self.products objectAtIndex:indexPath.row];
	NSArray *child = [dict objectForKey:@"Children"];
	
	if([child count] == 0) {
		
		ProductDetailViewController *rvController = [[ProductDetailViewController alloc] initWithNibName:@"ProductDetailViewController" bundle:[NSBundle mainBundle]];
		rvController.navigationItem.prompt = [dict objectForKey:@"Title"];
		[self.navigationController pushViewController:rvController animated:YES];
		[rvController release];
	}
	else {
		
		ProductViewController *rvController = [[ProductViewController alloc] initWithNibName:@"ProductViewController" bundle:[NSBundle mainBundle]];
		rvController.title = [dict objectForKey:@"Title"];
		rvController.products = child;
		rvController.level += 1;
		[self.navigationController pushViewController:rvController animated:YES];
		[rvController release];
	}	
}

- (void)dealloc {
	
	[title release];
	[products release];
    [super dealloc];
}

@end

