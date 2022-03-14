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

PDFX_EXTERN CGFloat const kPDFXDestinationUnspecifiedValue;

@interface PDFXDestination : NSObject <NSCopying>

/// @name Initializing a Destination

- (instancetype)initWithPage:(PDFXPage *)page atPoint:(PDFXPoint)point;

/// @name Getting Pages and Points

@property (nonatomic, weak, readonly) PDFXPage *page;
@property (nonatomic, readonly) PDFXPoint point;

/// @name Zooming

@property (nonatomic) CGFloat zoom;

/// @name Comparing Destinations

- (NSComparisonResult)compare:(PDFXDestination *)destination;

@end

NS_ASSUME_NONNULL_END
