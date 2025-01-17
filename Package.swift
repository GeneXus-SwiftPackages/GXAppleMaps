// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAppleMaps",
	platforms: [.iOS("13.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXAppleMaps",
			targets: ["GXAppleMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "3.0.0-beta.4"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-beta.4")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMaps-3.0.0-beta.4.xcframework.zip",
			checksum: "1b104bd28980ab66f0d44845bb11a93567196674cc8bd82b81781617caf2adc8"
		)
	]
)