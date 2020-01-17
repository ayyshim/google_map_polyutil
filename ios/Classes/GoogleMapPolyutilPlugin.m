#import "GoogleMapPolyutilPlugin.h"
#if __has_include(<google_map_polyutil/google_map_polyutil-Swift.h>)
#import <google_map_polyutil/google_map_polyutil-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "google_map_polyutil-Swift.h"
#endif

@implementation GoogleMapPolyutilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGoogleMapPolyutilPlugin registerWithRegistrar:registrar];
}
@end
