//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import <UIKit/UIKit.h>

#define PDFX_API_WARNING(message) __attribute__((deprecated(message)))
#define PDFX_OBJC_ONLY NS_SWIFT_UNAVAILABLE("Objective-C only, check corresponding Swift header (*+Swift.h).")

#define PDFX_EXTERN extern

#define PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN
#define PDFX_NOT_IMPLEMENTED_PRIORITY_LOW
#define PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM
#define PDFX_NOT_IMPLEMENTED_PRIORITY_HIGH

#define PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_UNKNOWN(...)
#define PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_LOW(...)
#define PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_MEDIUM(...)
#define PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_HIGH(...)

#define PDFXPlatformView UIView

#define PDFXFont UIEvent
#define PDFXColor UIColor
#define PDFXImage UIImage
#define PDFXEvent UIEvent
#define PDFXBezierPath UIBezierPath

#define PDFXEdgeInsets UIEdgeInsets
#define PDFXEdgeInsetsZero UIEdgeInsetsZero

#define PDFXPoint CGPoint
#define PDFXPointZero CGPointZero

#define PDFXSize CGSize
#define PDFXSizeZero CGSizeZero

#define PDFXRect CGRect
#define PDFXRectZero CGRectZero

#define PDFXAffineTransform CGAffineTransform
#define PDFXAffineTransformZero CGAffineTransformZero
#define PDFXAffineTransformIdentity CGAffineTransformIdentity
