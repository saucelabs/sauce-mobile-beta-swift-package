// swift-tools-version:5.3

import PackageDescription

// Sauce Mobile Beta SDK (formerly TestFairy SDK).
//
// Package/product are renamed to SauceMobileBeta,
// the binary module remains "TestFairy" so existing source/integrations keeps working unchanged:
//
//     import TestFairy
//     TestFairy.beginWithoutCrashHandler("<token>")
//
// This is the SwiftPM repository for the Sauce Mobile Beta iOS SDK.
// https://github.com/testfairy/testfairy-ios-sdk-swift-package mirrors it for existing TestFairy SwiftPM consumers.
let package = Package(
    name: "SauceMobileBeta",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SauceMobileBeta",
            targets: ["TestFairy"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "TestFairy",
            url: "https://testfairy.s3.amazonaws.com/sdk/SauceMobileBeta-2.3.0.xcframework.zip",
            checksum: "0968aff7d7dedc13df16961bef74b544275014ade68d6026d07efc06c9282fe2"
        ),
    ]
)
