//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXDestination+PSPDFKit.h"
#import "PDFXPage+PSPDFKit.h"

#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

#import <PDFKit/PDFKit.h>

CGFloat const kPDFXDestinationUnspecifiedValue = 3.4028234663852886e+38;

@implementation PDFXDestination

#pragma mark - Initializing the Class

+ (void)initialize {
    if (@available(iOS 11, *)) {
        if (kPDFXDestinationUnspecifiedValue != kPDFDestinationUnspecifiedValue) {
            [NSException raise:NSInternalInconsistencyException format:@"The constant kPDFXDestinationUnspecifiedValue = '%@' should equal kPDFDestinationUnspecifiedValue = '%@' but doesn't.", @(kPDFXDestinationUnspecifiedValue), @(kPDFDestinationUnspecifiedValue)];
        }
    }
}

#pragma mark - Initializing a Destination

- (instancetype)initWithPage:(PDFXPage *)page atPoint:(PDFXPoint)point {
    if ((self = [super init])) {
        _page = page;
        _point = point;
        _zoom = kPDFXDestinationUnspecifiedValue;
    }
    return self;
}

#pragma mark - Comparing Destinations

- (NSComparisonResult)compare:(PDFXDestination *)destination {
    let leftDocument = self.page.document;
    let rightDocument = destination.page.document;

    if (leftDocument == nil) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't compare destinations, page of left destination doesn't have an associated document: %@", self];
        return NSOrderedSame;
    }

    if (rightDocument == nil) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't compare destinations, page of right destination doesn't have an associated document: %@", destination];
        return NSOrderedSame;
    }

    if (leftDocument != rightDocument) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't compare destinations, pages of both destinations have different associated documents. Left destination: %@, right destination: %@", self, destination];
        return NSOrderedSame;
    }

    let leftPoint = self.point;
    let rightPoint = destination.point;

    // Simplify comparison by using CGFLOAT_MAX to avoid handling special cases.
    let leftPointY = leftPoint.y == kPDFXDestinationUnspecifiedValue ? CGFLOAT_MAX : leftPoint.y;
    let rightPointY = rightPoint.y == kPDFXDestinationUnspecifiedValue ? CGFLOAT_MAX : rightPoint.y;

    if (leftPointY < rightPointY) {
        return NSOrderedDescending;
    }

    if (leftPointY > rightPointY) {
        return NSOrderedAscending;
    }

    return NSOrderedSame;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PDFXDestination  *copy = [[self.class alloc] initWithPage:self.page atPoint:self.point];
    copy.zoom = self.zoom;
    return copy;
}

@end
