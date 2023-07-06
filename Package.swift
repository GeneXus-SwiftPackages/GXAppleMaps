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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "1.0.0-beta.20230706155940"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230706155940"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "1.0.0-beta.20230706155940")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMaps-1.0.0-beta.20230706155940.xcframework.zip",
			checksum: "257940ce87f216710c5fafefdff84d5936d02a8e8013ba500c80e134fa4b7342"
		)
	]
)