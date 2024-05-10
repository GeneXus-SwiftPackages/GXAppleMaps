// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAppleMaps",
	platforms: [.iOS("12.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXAppleMaps",
			targets: ["GXAppleMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "2.0.0-beta.29"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.0-beta.29")
	],
	targets: [
		.target(name: "GXAppleMapsWrapper",
				dependencies: [
					"GXAppleMaps",
					.product(name: "GXCoreModule_Common_Maps", package: "GXCoreModule_Common_Maps", condition: .when(platforms: [.iOS, .tvOS, .visionOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAppleMaps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMaps-2.0.0-beta.29.xcframework.zip",
			checksum: "f996a718c6cfee035d4e4f3776a3328b0335eaceb174cb0bee9a55dcc387e697"
		)
	]
)