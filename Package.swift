// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAppleMaps",
	platforms: [.iOS("15.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXAppleMaps",
			targets: ["GXAppleMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "4.0.17"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.17")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXAppleMaps-4.0.17.xcframework.zip",
			checksum: "56ebdfee5e05069b48b5cec67772121d997c4cbcb48e0694ad4ebac85f083167"
		)
	]
)