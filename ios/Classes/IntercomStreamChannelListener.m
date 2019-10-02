#import "IntercomStreamChannelListener.h"
#import "Intercom.h"

FlutterEventSink _eventSink;

@implementation IntercomStreamChannelListener

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    _eventSink = events;
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(receiveTestNotification:)
    name:IntercomUnreadConversationCountDidChangeNotification
    object:nil];
    return nil;
}

- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _eventSink = nil;
    return nil;
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:IntercomUnreadConversationCountDidChangeNotification]) {
        NSUInteger count = [Intercom unreadConversationCount];
        [self emit:count];
    }
}

- (void)emit:(NSUInteger) count {
    if(_eventSink != nil) {
       _eventSink(@(count));
    }
}
@end
