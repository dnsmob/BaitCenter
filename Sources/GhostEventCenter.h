
#ifdef __APPLE__
#include "TargetConditionals.h"

    #if TARGET_IPHONE_SIMULATOR
    // ios simulator
    #import <UIKit/UIKit.h>

    #elif TARGET_OS_IPHONE
    // ios device
    #import <UIKit/UIKit.h>

    #elif TARGET_OS_MAC
    // mac os
    #import <Cocoa/Cocoa.h>

    #else
    // Unsupported platform
    #endif
#endif


//! Project version number for iOS.
FOUNDATION_EXPORT double GhostEventCenterVersionNumber;

//! Project version string for iOS.
FOUNDATION_EXPORT const unsigned char GhostEventCenterVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <iOS/PublicHeader.h>


