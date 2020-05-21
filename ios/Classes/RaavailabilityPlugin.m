#import "RaavailabilityPlugin.h"
#if __has_include(<raavailability/raavailability-Swift.h>)
#import <raavailability/raavailability-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "raavailability-Swift.h"
#endif

@implementation RaavailabilityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRaavailabilityPlugin registerWithRegistrar:registrar];
}
@end
