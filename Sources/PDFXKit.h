//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#ifndef PDFX_APPLE_PDFKIT_SOURCE_COMPATIBLE
#define PDFX_APPLE_PDFKIT_SOURCE_COMPATIBLE 1
#endif

#import "PDFXAction.h"
#import "PDFXActionGoTo.h"
#import "PDFXActionNamed.h"
#import "PDFXActionResetForm.h"
#import "PDFXActionRemoteGoTo.h"
#import "PDFXActionURL.h"
#import "PDFXAnnotation.h"
#import "PDFXAnnotationPopup.h"
#import "PDFXAppearanceCharacteristics.h"
#import "PDFXBorder.h"
#import "PDFXDestination.h"
#import "PDFXDocument.h"
#import "PDFXOutline.h"
#import "PDFXPage.h"
#import "PDFXSelection.h"
#import "PDFXThumbnailView.h"
#import "PDFXView.h"

#import "PDFXDocumentDelegate.h"
#import "PDFXViewDelegate.h"

// WORKAROUND: bridging headers aren't supported for framework targets (yet?),
// we therefore need to make the Swift stuff public and expose to ObjC for the
// time being.
#import "PDFXKit+Swift.h"

#if PDFX_APPLE_PDFKIT_SOURCE_COMPATIBLE
#import "PDFXCompatibility.h"
#endif
