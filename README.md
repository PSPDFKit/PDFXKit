# PDFXKit

PDFXKit is a drop-in replacement for [Apple
PDFKit](https://developer.apple.com/documentation/pdfkit) using the industry
leading [PSPDFKit](http://pspdfkit.com) framework under the hood. The latest
version requires [PSPDFKit 6.9 for
iOS](https://pspdfkit.com/blog/2017/pspdfkit-ios-6-9/) and Xcode 9.

**Note**: [PSPDFKit](http://pspdfkit.com) is a *commercial* product and requires
a [paid license](https://pspdfkit.com/sales/). Please sign up for a [free trial](http://pspdfkit.com/try)
to receive an evaluation license if you haven't a production license yet.

## Introduction

Apple's PDFKit provides a great starting point if you need to integrate PDF
support into your macOS or iOS app. It is a system library and as such the
easiest to integrate.

PSPDFKit on the other hand goes much further offering you a cross-platform
drop-in solution with many additional UI components, advanced PDF features,
and first class support directly from the developers.

To simplify migrating a code base from PDFKit to PSPDFKit as much as possible,
we provide a wrapper called [PDFXKit][]. It is a drop-in replacement with little
or no changes required allowing you to program against the PDFKit API while
using PSPDFKit under the hood.

For more details, please consult the
[Migrating from Apple PDFKit](https://pspdfkit.com/guides/ios/current/migration-guides/migrating-from-apple-pdfkit/)
migration guide.

## Getting Started

Make sure you have access to PSPDFKit either as a customer or by signing up for
a [free trial](https://pspdfkit.com/try/).

### Using Cocoapods

We assume you are familiar with [Cocoapods](https://cocoapods.org), otherwise
please consult the documentation first. You'll have to add PSPDFKit as well as
PDFXKit as a dependency to your `Podfile`.

``` Ruby
# Replace `YourAppName` with your app's target name.
target :YourAppName do
  use_frameworks!

  # Replace `YOUR_COCOAPODS_KEY` with your own.
  pod 'PSPDFKit', podspec: 'https://customers.pspdfkit.com/cocoapods/YOUR_COCOAPODS_KEY/latest.podspec'
  pod 'PDFXKit', :git => "git@github.com:PSPDFKit/PDFXKit.git", :branch => "master"
end
```

**Note:** make sure to replace `YourAppName` with your app name and
`YOUR_COCOAPODS_KEY` with your own key provided by PSPDFKit GmbH. You can find
your key either in [customer portal](https://customers.pspdfkit.com/) or by
requesting an [evaluation license](https://pspdfkit.com/try/).

Now run `pod install`. Afterwards you should be able to build & run your project
without errors. Next you'll have to adapt your project to use PDFXKit as
described in Section [Switch to PDFXKit](#switch-to-pdfxkit).

### Using Carthage

We assume you are familiar with
[Carthage](https://github.com/Carthage/Carthage), otherwise please consult the
Carthage documentation first. You'll have to add PSPDFKit as well as PDFXKit as
a dependency to your `Cartfile`.

``` Ruby
# Replace YOUR_CARTHAGE_KEY with your own
binary "https://customers.pspdfkit.com/carthage/YOUR_CARTHAGE_KEY/PSPDFKit.json"
git "git@github.com:PSPDFKit/PDFXKit.git" "master"
```

**Note:** make sure to replace `YOUR_CARTHAGE_KEY` with your own key provided
by PSPDFKit GmbH. You can find your key either in [customer
portal](https://customers.pspdfkit.com/) or by requesting an
[evaluation license](https://pspdfkit.com/try/).

Now follow the regular [Carthage setup routine](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)
to add `PSPDFKit.framework` and `PDFXKit.framework` as a dependency to your
project. Afterwards you should be able to build your project without errors.
Next you'll have to adapt your project to use PDFXKit as described in Section
[Switch to PDFXKit](#switch-to-pdfxkit).

### Manual Set-Up

**Note:** manual set-up is only for experts, we assume you know what you are
doing. If you are unsure, please use Cocoapods or Carthage instead.

First, build the PDFXKit framework:

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Copy `PSPDFKit.framework` into `PDFXKit/Frameworks`
* Open the terminal and `cd` into the `PDFXKit` directory
* Run `rake compile`

You should now have the `PDFXFKit.framework` in the `Build` folder. Next, add
the `PSPDFKit.framework` and `PDFXKit.framework` to your project:

* Follow the [Getting Started](https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/) instructions for PSPDFKit.

* Perform steps (1) and (2) from the above *Getting Started* guide, Section
  [Integrating the Dynamic Framework](https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/#toc_integrating-the-dynamic-framework),
  and add PDFXKit to your app similar to how you did it with PSPDFKit above.
  **Note:** make sure to adapt the path for the "Run Script" build phase for PDFXKit.

You should now be able to build & run your app.

### Switch to PDFXKit

We need to perform a couple of small changes in order to make your project use
PDFXKit instead of the system PDFKit.

First, update all source files to import `PDFXKit` instead of the `PDFKit`
framework using Xcode's project-wide search & replace:

* Open your project in Xcode
* Bring up the search & replace panel (Menu `Find` -> `Find and Replace in Project...`)
* Search & replace `import PDFKit` with `import PDFXKit`
* Search & replace `#import <PDFKit/PDFKit.h>` with `#import <PDFXKit/PDFXKit.h>`

If you are using storyboards or xibs, update all custom classes:

* Open each storyboard and replace all custom classes set to `PDFView` and
  `PDFThumbnailView` to `PDFXView` and `PDFXThumbnailView`.

* Open each xib and replace all custom classes set to `PDFView` and
  `PDFThumbnailView` to `PDFXView` and `PDFXThumbnailView`

If you are using Swift:

* Build & run your project, it should produce build erros for every use of a
  PDFKit notification constant, fix those by adding an `X` to the prefix, i.e.
  `.PDFViewPageChanged` should be ranamed to `.PDFXViewPageChanged`.

Build & run your project, your app is now using PDFXKit with PSPDFKit under the
hood.

Now make sure your app works as expected. Specifically, there might be a
conflict with your gesture recognizers. If so, implement the
`gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)` delegate method
for the conflicting gesture recognizer and return `true`.

## Limitations

PDFXKit is alpha software, many parts aren't implemented yet. Please take a
look at the headers, all unimplemented or only partially implemented symbols are
annotated with the `PDFX_NOT_IMPLEMENTED_PRIORITY_...` and
`PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_...` macros.

## Contributing

If you want to work on PDFXKit, perform the following steps:

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Copy `PSPDFKit.framework` from the release DMG into `PDFXKit/Frameworks`
* Open `PDFXKit.xcodeproj` in Xcode >= 9
* Build & run `PDFXKitExample` (iOS)

Technical notes:

* All PDFXKit source files live in the `Sources` directory, no nesting.

* Each class has a `...+Swift.h` header for Swift-only stuff which isn't exposed
  to Objective-C. Example: `PDFXDocument+Swift.h`.

* Each class has a `...+PSPDFKit.h` header for public PSPDFKit stuff, i.e. any
  interfaces that expose access to PSPDFKit when using PDFXKit. Example:
  `PDFXDocument+PSPDFKit.h`.

* Some of the classes have a `...+Private.h` header for internal stuff, i.e.
  needed by PDFXKit classes internally but shouldn't be exposed publicly.
  Example: `PDFXPage+Private.h`, exposes properties only allowed to be
  accessible by `PDFXDocument`.

## Known Issues

**Linker warning when building without Carthage**. In order to support Carthage
out-of-the-box with per-customer PSPDFKit URL, we've added the _parent_
Carthage build folder to the "Framework Search Paths". When building without
Carthage, this produces the following warning:

```
ld: warning: directory not found for option '-F/Users/konstantinbe/Projects/PSPDFKit/PDFXKit/../../../Carthage/Build/iOS'
```

**Conflicting gesture recognizers**. Your gesture recognizers might be in
conflict with some of PSPDFKit's recognizers. If so, implement the
`gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)` delegate method
for the conflicting gesture recognizer and return `true`.

## License

The PDFXKit wrapper is released under a modified version of the BSD license, see
[LICENSE.md](LICENSE.md) found at the root of this git repo.
