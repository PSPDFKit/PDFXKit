//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>

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
