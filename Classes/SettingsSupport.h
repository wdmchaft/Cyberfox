//
//  SettingsSupport.h
//  Simple RSS
//
//  Created by Dan Ross on 12/18/10.
//  Copyright © 2010 Natio Pty. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define	KEY_OPEN_IN_SAFARI		@"openLinksInSafari"


@interface SettingsSupport : NSObject {

}

+ (BOOL)isOpenInSafari;

+ (void)setOpenInSafari:(BOOL)open;

@end
