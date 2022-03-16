//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXPage+Private.h"
#import "PDFXPage+PSPDFKit.h"
#import "PDFXDocument+PSPDFKit.h"

#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

@interface PDFXPage ()

@property (nonatomic) PDFXImage *image;

@end

@implementation PDFXPage

#pragma mark - Initializing a Page

- (nullable instancetype)initWithDocument:(PDFXDocument *)document {
    if ((self = [self init])) {
        if (document != nil) {
            // This is a new page that we need to add to the document.
            let index = document.pageCount;
            [document insertPage:self atIndex:index];
        }
    }
    return self;
}

- (nullable instancetype)initWithImage:(PDFXImage *)image {
    if ((self = [super init])) {
        self.image = image;
    }
    return self;
}

#pragma mark - Getting Information About a Page

- (NSString *)label {
    return [self.document.pspdfDocument pageLabelForPageAtIndex:self.index substituteWithPlainLabel:NO];
}

- (PDFXRect)boundsForBox:(PDFXDisplayBox)box {
    // TODO: implement.
    return PDFXRectZero;
}

- (void)setBounds:(PDFXRect)bounds forBox:(PDFXDisplayBox)box {
    // TODO: implement.
}

- (NSInteger)rotation {
    // TODO: implement.
    return 0;
}

#pragma mark - Working with Annotations

- (NSArray<PDFXAnnotation*> *)annotations {
    // TODO: implement.
    return @[];
}

- (BOOL)displaysAnnotations {
    // TODO: implement.
    return YES;
}

- (void)addAnnotation:(PDFXAnnotation *)annotation {
    // TODO: implement.
}

- (void)removeAnnotation:(PDFXAnnotation *)annotation {
    // TODO: implement.
}

- (nullable PDFXAnnotation *)annotationAtPoint:(PDFXPoint)point {
    // TODO: implement.
    return nil;
}

#pragma mark - Rendering Pages

- (PDFXAffineTransform)transformForBox:(PDFXDisplayBox)box {
    // TODO: implement.
    return PDFXAffineTransformIdentity;
}

- (void)drawWithBox:(PDFXDisplayBox)box toContext:(CGContextRef)context {
    // TODO: implement.
}

- (void)transformContext:(CGContextRef)context forBox:(PDFXDisplayBox)box {
    // TODO: implement.
}

- (PDFXImage *)thumbnailOfSize:(PDFXSize)size forBox:(PDFXDisplayBox)box {
    NSError *error = nil;
    let thumbnail = [self.document.pspdfDocument imageForPageAtIndex:self.index size:size clippedToRect:CGRectZero annotations:nil options:nil error:&error];
    if (thumbnail == nil) {
        NSLog(@"[WARNING] Couldn't render thumbnail for page: %@, error: %@", self, error);
    }
    return thumbnail;
}

#pragma mark - Working with Textual Content

- (NSUInteger)numberOfCharacters {
    // TODO: implement.
    return 0;
}

- (NSString *)string {
    // TODO: implement.
    return @"";
}

- (NSAttributedString *)attributedString {
    // TODO: implement.
    return [NSAttributedString new];
}

- (PDFXRect)characterBoundsAtIndex:(NSInteger)index {
    // TODO: implement.
    return PDFXRectZero;
}

- (NSInteger)characterIndexAtPoint:(PDFXPoint)point {
    // TODO: implement.
    return NSNotFound;
}

#pragma mark - Working with Selections

- (nullable PDFXSelection *)selectionForRect:(PDFXRect)rect {
    // TODO: implement.
    return nil;
}

- (nullable PDFXSelection *)selectionForWordAtPoint:(PDFXPoint)point {
    // TODO: implement.
    return nil;
}

- (nullable PDFXSelection *)selectionForLineAtPoint:(PDFXPoint)point {
    // TODO: implement.
    return nil;
}

- (nullable PDFXSelection *)selectionFromPoint:(PDFXPoint)startPoint toPoint:(PDFXPoint)endPoint {
    // TODO: implement.
    return nil;
}

- (nullable PDFXSelection *)selectionForRange:(NSRange)range {
    // TODO: implement.
    return nil;
}

#pragma mark - Miscellanneous

- (NSData *)dataRepresentation {
    // TODO: implement.
    return nil;
}

- (CGPDFPageRef)pageRef {
    // TODO: implement.
    return nil;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    // TODO: implement.
    return [self.class new];
}

@end
