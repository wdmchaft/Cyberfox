//
//  SettingsViewController.m
//  Simple RSS
//
//  Created by Dan Ross on 12/11/10.
//  Copyright © 2010 Natio Pty. Ltd. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsSupport.h"


@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.title = @"Settings";
		[[self tabBarItem] setImage:[UIImage imageNamed:@"settings.png"]];
    }
    return self;
}

- (void)loadView {
	UIView *contentView = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
	
	contentView.autoresizesSubviews = YES;
	self.view = contentView;
	[self.view setBackgroundColor:[UIColor colorWithRed:0.14 green:0.18 blue:0.25 alpha:1.00]];
	
	CGRect frame = contentView.frame;
	frame.origin.x = 0;
	frame.origin.y = contentView.bounds.size.height - frame.size.height;
	frame.size.width = contentView.bounds.size.width;
	frame.size.height = contentView.bounds.size.height;
	
	tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
	tableView.delegate = self;
	tableView.dataSource = self;
	tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	tableView.backgroundColor = [UIColor colorWithRed:0.14 green:0.18 blue:0.25 alpha:1.00];
	
	[tableView reloadData];
	[self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *tvCell = [tView dequeueReusableCellWithIdentifier:@"ListMainControllerDoctorListCell"];
	
	if (tvCell == nil) {
		tvCell = [[[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 0, 0) reuseIdentifier:@"ListMainControllerDoctorListCell"] autorelease];
	}
	
	NSArray *views = tvCell.contentView.subviews;
	for(UIView *view in views) {
		if ([view isKindOfClass:[UISwitch class]]) {
			[view removeFromSuperview];
		}
	}
	
	if ([indexPath section] == 0) {
		switch([indexPath row]) {
			case 0:
				{
					UISwitch *linksSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(tvCell.frame.size.width - 126, 8, 64, 24)];
				
					[linksSwitch setOn:[SettingsSupport isOpenInSafari]];
					[linksSwitch addTarget:self action:@selector(openLinksSwitch:) forControlEvents:UIControlEventValueChanged];
					
					[tvCell setText:@"Open Links in Safari"];
					[tvCell.contentView addSubview:linksSwitch];
					[tvCell setSelectionStyle:UITableViewCellSelectionStyleNone];
					[tvCell setAccessoryType:UITableViewCellAccessoryNone];
				
					[linksSwitch release];
				}
				break;
		}
	} else if ([indexPath section] == 1) {
		switch([indexPath row]) {
			case 0:
				[tvCell setText:@"Report a Problem"];
				[tvCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
				[tvCell setSelectionStyle:UITableViewCellSelectionStyleGray];
				break;
				
			case 1:
				[tvCell setText:@"Make a Suggestion"];
				[tvCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
				[tvCell setSelectionStyle:UITableViewCellSelectionStyleGray];
				break;
		}
	}
	
	return tvCell;
}

- (void)openLinksSwitch:(UISwitch *)switchObject {
	[SettingsSupport setOpenInSafari:[switchObject isOn]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return 1;
	}
	
	return 2;
}

- (void)tableView:(UITableView *)tView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tView deselectRowAtIndexPath:indexPath animated:YES];
	
	if ([indexPath section] == 1) {
		switch([indexPath row]) {
			case 0:
				{
					NSString *mailtoLink = @"mailto:simplerss@willowtreeconsulting.com?subject=Charlottesville Tomorrow Bug Report";
					NSString *escapedLink = [mailtoLink stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
					[[UIApplication sharedApplication] openURL:[NSURL URLWithString:escapedLink]];
				}
				break;
				
			case 1:
				{
					NSString *mailtoLink = @"mailto:simplerss@willowtreeconsulting.com?subject=Charlottesville Tomorrow Suggestion";
					NSString *escapedLink = [mailtoLink stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
					[[UIApplication sharedApplication] openURL:[NSURL URLWithString:escapedLink]];
				}
				break;
		}
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == 1) {
		return @"\nVersion 1.0.2";
	}
	
	return @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
