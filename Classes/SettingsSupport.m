//
//  SettingsSupport.m
//  Simple RSS
//
//  Created by Dan Ross on 12/18/10.
//  Copyright © 2010 Natio Pty. Ltd. All rights reserved..
//

#import "SettingsSupport.h"


@implementation SettingsSupport

+ (BOOL)isOpenInSafari {
	return [[NSUserDefaults standardUserDefaults] boolForKey:KEY_OPEN_IN_SAFARI];
}

+ (void)setOpenInSafari:(BOOL)open {
	[[NSUserDefaults standardUserDefaults] setBool:open forKey:KEY_OPEN_IN_SAFARI];
}

@end
