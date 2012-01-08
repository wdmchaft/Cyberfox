//
//  SimpleWebViewController.h
//  Simple RSS
//
//  Copyright 2011 Natio Pty. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SimpleWebViewController : UIViewController <UIWebViewDelegate> {
	UIView *loadingView;
	UIWebView *webView;
	NSString *requestUrl;
	UIBarButtonItem *refreshButton;
	UIBarButtonItem *backButton;
	BOOL backTapped;
}

- (id) initWithUrl:(NSString *)url;
- (void) setUrl:(NSString *)url;

@end
