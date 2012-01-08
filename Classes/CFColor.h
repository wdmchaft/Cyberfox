
#import <UIKit/UIKit.h>

@interface CFColor : NSObject
{
	UInt8* pixelData;
	CGImageRef imageRef;
	int width;
}

-(id) initWithImage: (UIImage*) image;

-(NSString *) colorAtX:(int) x y:(int) y;

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end