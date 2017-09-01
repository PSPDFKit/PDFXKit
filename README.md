# PDFXKit

Required PSPDFKit version: 6.9.

## Getting Started

Make sure you have access to PSPDFKit either as a customer or by signing up for
a [free trial](https://pspdfkit.com/try/).

### Using Carthage

We assume you are familiar with Carthage otherwise please consult the Carthage
documentation first. You'll have to add PSPDFKit as well as PDFXKit as a
dependency to your `Cartfile`.

``` Ruby
# Replace YOUR_CARTHAGE_KEY with your own
binary "https://customers.pspdfkit.com/carthage/YOUR_CARTHAGE_KEY/PSPDFKit.json"
git "git@github.com:PSPDFKit/PDFXKit.git" "master"
```

**Note:** make sure to replace `YOUR_CARTHAGE_KEY` with your own key provided by PSPDFKit GmbH.

Now follow the regular [Carthage setup routine](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)
to add `PSPDFKit.framework` and `PDFXKit.framework` as a dependency to your
project. Afterwards you should be able to build your project without errors.

### Using Cocoapods

Not supported yet.

### Manual Set-Up

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
* If you have Swift sources: search & replace `import PDFKit` with `import PDFXKit`
* If you have Objective-C sources: search & replace `#import <PDFKit/PDFKit.h>` with `#import <PDFXKit/PDFXKit.h>`

If you are using storyboards or xibs, update all custom classes:

* Open each storyboard and replace all custom classes set to `PDFView` and
`PDFThumbnailView` to `PDFXView` and `PDFXThumbnailView`

* Open each xib and replace all custom classes set to `PDFView` and
`PDFThumbnailView` to `PDFXView` and `PDFXThumbnailView`

If you are using Swift:

* Build & run your project, it should produce build erros for every use of a
  PDFKit notification constant, fix those by adding an `X` to the prefix, i.e.
  `.PDFViewPageChanged` should be ranamed to `.PDFXViewPageChanged`.

Build & run your project, your app is now using PDFXKit with PSPDFKit under the
hood.

## Contributing

If you want to work on PDFXKit, perform the following steps:

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Copy `PSPDFKit.framework` from the release DMG into `PDFXKit/Frameworks`
* Open `PDFXKit.xcodeproj` in Xcode >= 9
* Build & run `PDFXKitExample` (iOS)

## License

The PDFXKit wrapper is released under a modified version of the BSD license, see
[LICENSE.md](LICENSE.md) found at the root of this git repo.
