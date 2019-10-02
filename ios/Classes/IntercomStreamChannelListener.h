#import <Flutter/Flutter.h>

@interface IntercomStreamChannelListener : NSObject<FlutterStreamHandler>
- (void)emit:(NSUInteger) count;
@end
