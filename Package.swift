// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXAppleMaps",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXAppleMaps",
			targets: ["GXAppleMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "1.0.0-beta.20230710170706"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230710170706"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "1.0.0-beta.20230710170706")
	],
	targets: [
		.target(name: "GXAppleMapsWrapper",
				dependencies: [
					"GXAppleMaps",
					.product(name: "GXCoreModule_Common_Maps", package: "GXCoreModule_Common_Maps", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXUCMaps", package: "GXUCMaps", condition: .when(platforms: [.tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAppleMaps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMaps-1.0.0-beta.20230710170706.xcframework.zip",
			checksum: "23e1e326b7acd50534ad99b5d3f8553979acb6dd161946d335c0e09573bc5bbd"
		)
	]
)