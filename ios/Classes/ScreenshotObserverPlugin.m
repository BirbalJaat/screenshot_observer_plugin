#import "ScreenshotObserverPlugin.h"
#if __has_include(<screenshot_observer_plugin/screenshot_observer_plugin-Swift.h>)
#import <screenshot_observer_plugin/screenshot_observer_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "screenshot_observer_plugin-Swift.h"
#endif

@implementation ScreenshotObserverPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [ScreenshotObserverPlugin registerWithRegistrar:registrar];
}
@end
