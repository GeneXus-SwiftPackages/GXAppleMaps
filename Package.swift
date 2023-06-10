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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", revision: "bf4043893564b764862aa687a981a1125e0e89e0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", revision: "8d33dc7510f9908c8b1814a960f6afdd974e9c43"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", revision: "ee3d92d9a11efd95f3c8f174f5b595c309151b5c")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMaps-1.0.0-beta+20230610052334.xcframework.zip",
			checksum: "78c2618729787d8dddf5f6e494beec18106e9d790420947ae7b8f3179830bbc1"
		)
	]
)