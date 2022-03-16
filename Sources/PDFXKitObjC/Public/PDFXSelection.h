//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXPage.h>
#else
#import "PDFXPlatform.h"
#import "PDFXPage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class PDFXDocument;

@interface PDFXSelection : NSObject <NSCopying>

/// @name Initializing a Selection

- (instancetype)initWithDocument:(PDFXDocument *)document PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Getting Information About a Selection

@property (nonatomic, readonly) NSArray<PDFXPage *> *pages PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, readonly, nullable) NSString *string PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly, nullable) NSAttributedString *attributedString PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (PDFXRect)boundsForPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (NSArray<PDFXSelection *> *)selectionsByLine PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) PDFXColor *color PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (NSUInteger)numberOfTextRangesOnPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (NSRange)rangeAtIndex:(NSUInteger)index onPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Modifying a Selection

- (void)addSelection:(PDFXSelection *)selection PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)addSelections:(NSArray<PDFXSelection*> *)selections PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)extendSelectionAtEnd:(NSInteger)succeed PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)extendSelectionAtStart:(NSInteger)precede PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)extendSelectionForLineBoundaries PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Managing Selection Drawing

- (void)drawForPage:(PDFXPage *)page active:(BOOL)active PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)drawForPage:(PDFXPage *)page withBox:(PDFXDisplayBox)box active:(BOOL)active PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
