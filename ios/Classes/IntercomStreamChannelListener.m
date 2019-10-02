#import "IntercomStreamChannelListener.h"
#import "Intercom.h"

FlutterEventSink _eventSink;

@implementation IntercomStreamChannelListener

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    _eventSink = events;
    return nil;
}


- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    _eventSink = nil;
    return nil;
}

- (void)emit:(NSUInteger) count {
    if(_eventSink != nil) {
       _eventSink(@(count));
    }
}
@end
