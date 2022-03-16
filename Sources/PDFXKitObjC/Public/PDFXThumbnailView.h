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

@class PDFXPage;
@class PDFXView;

typedef NS_ENUM(NSInteger, PDFXThumbnailLayoutMode) {
    PDFXThumbnailLayoutModeVertical = 0,
    PDFXThumbnailLayoutModeHorizontal = 1
};

PDFX_EXTERN NSNotificationName const PDFXThumbnailViewDocumentEditedNotification;

@interface PDFXThumbnailView :  PDFXPlatformView <NSCoding>

@property (nonatomic, strong, nullable) PDFXView *PDFView PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXSize thumbnailSize PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) PDFXColor *backgroundColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXThumbnailLayoutMode layoutMode PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) PDFXEdgeInsets contentInset PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, readonly, strong, nullable) NSArray<PDFXPage*> *selectedPages PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
