# PDFXKit

Required PSPDFKit version: 6.9.

## Getting Started

Make sure you have access to PSPDFKit either as a customer or by signing up for
a [free trial](https://pspdfkit.com/try/).

First, build the PDFXKit framework:

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Copy `PSPDFKit.framework` from the release DMG into `PDFXKit/Frameworks`
* Open the terminal and `cd` into the `PDFXKit` directory
* Run `rake compile`

You should now have the `PSPDFKit.framework` in the `Build` folder. Next, add
the `PSPDFKit.framework` and `PDFXKit.framework` to your app:

* Follow the *Getting Started* instructions and add `PSPDFKit` to your app:
  https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/

* Perform steps (1) and (2) from the above *Getting Started* guide, section
  *Integrating the Dynamic Framework*, and add `PDFXKit` to your app similar to
  how you did it with PSPDFKit (make sure to adapt the path for the "Run Script" build phase):
  https://pspdfkit.com/guides/ios/current/getting-started/integrating-pspdfkit/#toc_integrating-the-dynamic-framework

Now update all source files to import `PDFXKit` instead of the `PDFKit`
framework:

* If you have Swift sources: search & replace `import PDFKit` with `import PDFXKit`
* If you have Objective-C sources: search & replace `#import <PDFKit/PDFKit.h>` with `#import <PDFXKit/PDFXKit.h>`

If you are using storyboards or xibs, update all custom classes:

* Open each storyboard and replace all custom classes set to `PDFView` and
`PDFThumbnailView` to `PDFXView` and `PDFXThumbnailView`

* Open each xib and replace all custom classes set to `PDFView` and
`PDFThumbnailView` to `PDFXView` and `PDFXThumbnailView`

If you are using Swift:

* Build & run your project, it should produce build erros for every use of a
  PDFKit notification constant, fix those adding an `X` to the prefix, i.e.
  `.PDFViewPageChanged` should be ranamed to `.PDFXViewPageChanged`.

Build & run your project, your app is now using PDFXKit with PSPDFKit under the
hood.

## Working on PDFXKit

If you want to work on PDFXKit, perform the following steps:

* Clone `git@github.com:PSPDFKit/PDFXKit.git`
* Copy `PSPDFKit.framework` from the release DMG into `PDFXKit/Frameworks`
* Open `PDFXKit.xcodeproj` in Xcode >= 9
* Build & run `PDFXKitExample` (iOS)

## License

Copyright © 2017 PSPDFKit GmbH. All rights reserved.
