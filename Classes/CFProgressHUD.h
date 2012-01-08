
#import <Foundation/Foundation.h>

@interface CFProgressHUD : NSObject

- (void) show:(BOOL)yesOrNo;
- (CFProgressHUD *) initWithWindow:(UIView *)window;
- (void) setText:(NSString *)text;

@end
