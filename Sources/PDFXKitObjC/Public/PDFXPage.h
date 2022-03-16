//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#else
#import "PDFXPlatform.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PDFXDisplayBox) {
    kPDFXDisplayBoxMediaBox = 0,
    kPDFXDisplayBoxCropBox = 1,
    kPDFXDisplayBoxBleedBox = 2,
    kPDFXDisplayBoxTrimBox = 3,
    kPDFXDisplayBoxArtBox = 4
};

@class PDFXAnnotation;
@class PDFXDocument;
@class PDFXPage;
@class PDFXSelection;

@interface PDFXPage : NSObject <NSCopying>

/// @name Initializing a Page

/**
 Equivalent to creating a page by initializing without a document and inserting
 that page at the end of the document.
 */
- (nullable instancetype)initWithDocument:(PDFXDocument *)document PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (nullable instancetype)initWithImage:(PDFXImage *)image PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Getting Information About a Page

@property (nonatomic, readonly, weak, nullable) PDFXDocument *document PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly, nullable) NSString *label PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (PDFXRect)boundsForBox:(PDFXDisplayBox)box PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)setBounds:(PDFXRect)bounds forBox:(PDFXDisplayBox)box PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) NSInteger rotation PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Working with Annotations

@property (nonatomic, readonly) NSArray<PDFXAnnotation*> *annotations PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) BOOL displaysAnnotations PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)addAnnotation:(PDFXAnnotation *)annotation PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)removeAnnotation:(PDFXAnnotation *)annotation PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (nullable PDFXAnnotation *)annotationAtPoint:(PDFXPoint)point PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Rendering Pages

- (PDFXAffineTransform)transformForBox:(PDFXDisplayBox)box PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)drawWithBox:(PDFXDisplayBox)box toContext:(CGContextRef)context PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)transformContext:(CGContextRef)context forBox:(PDFXDisplayBox)box PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (PDFXImage *)thumbnailOfSize:(PDFXSize)size forBox:(PDFXDisplayBox)box PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Working with Textual Content

@property (nonatomic, readonly) NSUInteger numberOfCharacters PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, readonly, nullable) NSString *string PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly, nullable) NSAttributedString *attributedString PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (PDFXRect)characterBoundsAtIndex:(NSInteger)index PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (NSInteger)characterIndexAtPoint:(PDFXPoint)point PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Working with Selections

- (nullable PDFXSelection *)selectionForRect:(PDFXRect)rect PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (nullable PDFXSelection *)selectionForWordAtPoint:(PDFXPoint)point PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (nullable PDFXSelection *)selectionForLineAtPoint:(PDFXPoint)point PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (nullable PDFXSelection *)selectionFromPoint:(PDFXPoint)startPoint toPoint:(PDFXPoint)endPoint PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (nullable PDFXSelection *)selectionForRange:(NSRange)range PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Miscellanneous

@property (nonatomic, readonly) NSData *dataRepresentation PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly, nullable) CGPDFPageRef pageRef PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
