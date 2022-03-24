# PDFXKit

PDFXKit is a drop-in replacement for [Apple
PDFKit](https://developer.apple.com/documentation/pdfkit) using the industry
leading [PSPDFKit](http://pspdfkit.com) framework under the hood. The latest
version requires [PSPDFKit 11.2.4 for
iOS](https://pspdfkit.com/changelog/ios/#11.3) and Xcode 13.2.1.

[![](https://pspdfkit.com/assets/images/blog/2017/pdfxkit/pdfxkit-7b7a75f5.png)](https://pspdfkit.com/blog/2017/introducing-pdfxkit/)

**Note**: [PSPDFKit](http://pspdfkit.com) is a *commercial* product and requires
a [paid license](https://pspdfkit.com/sales/) for production use.

## Introduction

Apple's PDFKit provides a great starting point if you need to integrate PDF
support into your macOS or iOS app. It is a system library and as such the
easiest to integrate.

PSPDFKit on the other hand goes much further offering you a cross-platform
drop-in solution with many additional UI components, advanced PDF features,
and first class support directly from the developers.

Migrating the full code base to PSPDFKit can be a major undertaking and a deal
breaker for many developers. This is where PDFXKit comes in. It is a drop-in
replacement giving you the same API as PDFKit while using PSPDFKit under the
hood.

For more details, please consult the
[announcement blog post](https://pspdfkit.com/blog/2017/introducing-pdfxkit/)
as well as the
[Migrating from Apple PDFKit](https://pspdfkit.com/guides/ios/current/migration-guides/migrating-from-apple-pdfkit/)
guide.

## Support, Issues and License Questions

PSPDFKit offers support for customers with an active SDK license via https://pspdfkit.com/support/request/

Are you [evaluating our SDK](https://pspdfkit.com/try/)? That's great, we're happy to help out! To make sure this is fast, please use a work email and have someone from your company fill out our sales form: https://pspdfkit.com/sales/

## Getting Started

You can freely evaluate PSPDFKit without a license. The framework will display a watermark on the opened PDFs.
For production use and licensing please refer to the previous section.

### Using Swift Package Manager

Add PDFXKit Swift Package to your project:
- In Xcode 13 or higher, go to File / Add Packages… and enter the following package repository URL into the search field: `https://github.com/PSPDFKit/PDFXKit`.
- Select "Up to Next Major Version" follow the instructions to finish the setup

### Using CocoaPods

We assume you are familiar with [CocoaPods](https://cocoapods.org), otherwise
please consult the documentation first. 

First, you'll have to add PDFXKit as a dependency to your `Podfile`:

``` Ruby
# Replace `YourAppName` with your app's target name.
target :YourAppName do
  pod 'PDFXKit', :git => "git@github.com:PSPDFKit/PDFXKit.git", :branch => "master"
end
```

Now run `pod install`. Afterwards you should be able to build & run your project
without errors. Next you'll have to adapt your project to use PDFXKit as
described in Section [Switch to PDFXKit](#switch-to-pdfxkit).

### Manual Setup

**Note:** manual setup is only for experts, we assume you know what you are
doing. If you are unsure, please use CocoaPods instead.

First, build the PDFXKit framework:

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Open the terminal and `cd` into the `PDFXKit` directory
* Run `rake compile`

You should now have the `PDFXFKit.xcframework` in the `Build` folder. Next, add
the `PSPDFKit.xcframework`, `PSPDFKitUI.xcframework`, and `PDFXKit.xcframework` to your project:

* Follow the [*Getting Started*](https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/) instructions for PSPDFKit.

* Perform steps (1) and (2) from the above *Getting Started* guide, Section
  [Integrating the Dynamic Framework](https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/#toc_integrating-the-dynamic-framework),
  and add PDFXKit to your app similar to how you did it with PSPDFKit above. You
  may also want to set up your [test targets](https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/#toc_test-targets) accordingly.

You should now be able to build & run your app.

### Switch to PDFXKit

First, register the PSPDFKit license for your project as described in
[*Adding the License
Key*](https://pspdfkit.com/guides/ios/current/getting-started/adding-the-license-key/)
guide.

Now we need to perform a couple of small changes in order to make your project use
PDFXKit instead of the system PDFKit.

Update all source files to import `PDFXKit` instead of the `PDFKit`
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

PDFXKit is beta software, many parts aren't implemented yet. Please take a
look at the headers, all unimplemented or only partially implemented symbols are
annotated with the `PDFX_NOT_IMPLEMENTED_PRIORITY_...` and
`PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_...` macros.

## Run the Example Project

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Open `PDFXKit.xcworkspace` and wait for the Swift package manager to download the dependencies
* Build & Run `PDFXKitExample`

## Contributing

Please [sign our CLA agreement](https://pspdfkit.com/guides/web/current/miscellaneous/contributing/) so we can accept your pull requests.

## Technical notes

* All PDFXKit source files live in the `Sources` directory.

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

**Conflicting gesture recognizers**. Your gesture recognizers might be in
conflict with some of PSPDFKit's recognizers. If so, implement the
`gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)` delegate method
for the conflicting gesture recognizer and return `true`.

## License

The PDFXKit wrapper is released under a modified version of the BSD license, see
[LICENSE.md](LICENSE.md) found at the root of this git repo.
