# Sauce Mobile Beta SDK for iOS

Swift Package distribution of the **Sauce Mobile Beta** iOS SDK (formerly the TestFairy SDK) session recording, feedback, and beta distribution for iOS, built to run alongside **Backtrace** error reporting.

This artifact is **crashless**: it ships no crash handler of its own and never installs one. Use Backtrace for Error and Crash Reporting.


## Installation

Xcode → *File → Add Package Dependencies…* and enter:

```
https://github.com/saucelabs/sauce-mobile-beta-ios.git
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/saucelabs/sauce-mobile-beta-ios.git", exact: "2.3.0")
],
targets: [
    .target(name: "YourApp", dependencies: [
        .product(name: "SauceMobileBeta", package: "sauce-mobile-beta-ios")
    ])
]
```

The SwiftPM **product** is `SauceMobileBeta`. The runtime **module** is still `TestFairy`, so existing TestFairy source keeps working unchanged (`import TestFairy`, `#import <TestFairy/TestFairy.h>`).

## Usage with Backtrace

```swift
import Backtrace
import TestFairy

// 1. Initialize Backtrace first — it is the crash owner.
// 2. Start Sauce Mobile Beta WITHOUT a crash handler.
TestFairy.beginWithoutCrashHandler("<sauce-mobile-beta-token>")
```

Do not call `enableCrashHandler` / `installCrashHandler`: they are no-ops in this crashless artifact and Backtrace already owns crash reporting.

Never install both this package and the legacy TestFairy SwiftPM package (or `pod 'TestFairy'`) in one app — both provide the `TestFairy` module and the build fails with a duplicate-module conflict.

## Versions

Releases are tagged with plain semantic versions (`2.3.0`, `2.2.0-rc2`, …) and point at the crashless `SauceMobileBeta-<version>.xcframework.zip` published by the SDK release pipeline.
Every artifact passes a crashless validation gate (no crash-reporter symbols or strings) before its checksum lands here.

`https://github.com/testfairy/testfairy-ios-sdk-swift-package` mirrors this repository for existing TestFairy SwiftPM consumers.

## License

Apache License 2.0 — see [LICENSE](LICENSE).
Copyright 2017-2026 Sauce Labs Inc.
