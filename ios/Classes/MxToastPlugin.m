#import "MxToastPlugin.h"
#if __has_include(<mx_toast/mx_toast-Swift.h>)
#import <mx_toast/mx_toast-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mx_toast-Swift.h"
#endif

@implementation MxToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMxToastPlugin registerWithRegistrar:registrar];
}
@end
