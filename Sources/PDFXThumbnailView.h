//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>

NS_ASSUME_NONNULL_BEGIN

@class PDFXPage;
@class PDFXView;

typedef NS_ENUM(NSInteger, PDFXThumbnailLayoutMode) {
    PDFXThumbnailLayoutModeVertical = 0,
    PDFXThumbnailLayoutModeHorizontal = 1
};

NSNotificationName const PDFXThumbnailViewDocumentEditedNotification;

@interface PDFXThumbnailView :  PDFXPlatformView <NSCoding>

@property (nonatomic, strong, nullable) PDFXView *PDFView PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXSize thumbnailSize PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) PDFXColor *backgroundColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXThumbnailLayoutMode layoutMode PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) PDFXEdgeInsets contentInset PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, readonly, strong, nullable) NSArray<PDFXPage*> *selectedPages PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
