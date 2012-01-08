//
//  SettingsViewController.h
//  Simple RSS
//
//  Created by Dan Ross on 12/11/10.
//  Copyright © 2010 Natio Pty. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
@private
	UITableView *tableView;
}

@end
