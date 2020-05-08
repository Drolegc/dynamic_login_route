#import "DynamicloginroutePlugin.h"
#if __has_include(<dynamicloginroute/dynamicloginroute-Swift.h>)
#import <dynamicloginroute/dynamicloginroute-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dynamicloginroute-Swift.h"
#endif

@implementation DynamicloginroutePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDynamicloginroutePlugin registerWithRegistrar:registrar];
}
@end
