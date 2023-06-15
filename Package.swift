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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "1.0.0-beta.20230615110131"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230615110131"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "1.0.0-beta.20230615110131")
	],
	targets: [
		.target(name: "GXAppleMapsWrapper",
				dependencies: [
					"GXAppleMaps",
					.product(name: "GXCoreModule_Common_Maps", package: "GXCoreModule_Common_Maps", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXUCMaps", package: "GXUCMaps", condition: .when(platforms: [.tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAppleMaps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMaps-1.0.0-beta.20230615110131.xcframework.zip",
			checksum: "70d4621b1abafd8d22f5fab4ad0a9325b3bfe3ba2ccbd2f9a17b57d40914402b"
		)
	]
)