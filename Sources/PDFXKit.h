//
//  Copyright (c) 2017 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#define PDFX_APPLE_PDFKIT_SOURCE_COMPATIBLE 1

#import <PDFXKit/PDFXAction.h>
#import <PDFXKit/PDFXActionGoTo.h>
#import <PDFXKit/PDFXActionNamed.h>
#import <PDFXKit/PDFXActionResetForm.h>
#import <PDFXKit/PDFXActionRemoteGoTo.h>
#import <PDFXKit/PDFXActionURL.h>
#import <PDFXKit/PDFXAnnotation.h>
#import <PDFXKit/PDFXAnnotationPopup.h>
#import <PDFXKit/PDFXAppearanceCharacteristics.h>
#import <PDFXKit/PDFXBorder.h>
#import <PDFXKit/PDFXDestination.h>
#import <PDFXKit/PDFXDocument.h>
#import <PDFXKit/PDFXOutline.h>
#import <PDFXKit/PDFXPage.h>
#import <PDFXKit/PDFXSelection.h>
#import <PDFXKit/PDFXThumbnailView.h>
#import <PDFXKit/PDFXView.h>

#import <PDFXKit/PDFXDocumentDelegate.h>
#import <PDFXKit/PDFXViewDelegate.h>

// WORKAROUND: bridging headers aren't supported for framework targets (yet?),
// we therefore need to make the Swift stuff public and expose to ObjC for the
// time being.
#import <PDFXKit/PDFXKit+Swift.h>

#import <PDFXKit/PDFXCompatibility.h>
