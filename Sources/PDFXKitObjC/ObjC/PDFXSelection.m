//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXSelection+Private.h"
#import "PDFXSelection+PSPDFKit.h"
#import "PDFXDocument+PSPDFKit.h"
#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

@interface PDFXSelection ()

@property (nonatomic, readwrite, nullable) NSString *string;
@property (nonatomic) PDFXDocument *document;
@property (nonatomic) PDFXPage *page;
@property (nonatomic) NSRange range;

@end

@implementation PDFXSelection

#pragma mark - Initializing a Selection

- (instancetype)initWithDocument:(PDFXDocument *)document {
    return [self initWithDocument:document page:nil range:NSMakeRange(NSNotFound, 0) string:nil];
}

#pragma mark - Getting Information About a Selection

- (NSArray<PDFXPage*> *)pages {
    return @[self.page];
}

- (NSAttributedString *)attributedString {
    return [[NSAttributedString alloc] initWithString:self.string];
}

- (PDFXRect)boundsForPage:(PDFXPage *)page {
    // TODO: implement.
    return PDFXRectZero;
}

- (NSArray<PDFXSelection*>*)selectionsByLine {
    // TODO: implement.
    return @[];
}

// @property (nonatomic, copy, nullable) PDFXColor *color;

- (NSUInteger)numberOfTextRangesOnPage:(PDFXPage *)page {
    if (self.page == nil) { return 0; }
    if (page != self.page) { return 0; }
    if (self.range.location == NSNotFound) { return 0; }
    return 1;
}

- (NSRange)rangeAtIndex:(NSUInteger)index onPage:(PDFXPage *)page {
    NSParameterAssert(index == 0);
    return self.range;
}

#pragma mark - Modifying a Selection

- (void)addSelection:(PDFXSelection *)selection {
    // TODO: implement.
}

- (void)addSelections:(NSArray<PDFXSelection *> *)selections {
    // TODO: implement.
}

- (void)extendSelectionAtEnd:(NSInteger)succeed {
    // TODO: implement.
}

- (void)extendSelectionAtStart:(NSInteger)precede {
    // TODO: implement.
}

- (void)extendSelectionForLineBoundaries {
    // TODO: implement.
}

#pragma mark - Managing Selection Drawing

- (void)drawForPage:(PDFXPage *)page active:(BOOL)active {
    // TODO: implement.
}

- (void)drawForPage:(PDFXPage *)page withBox:(PDFXDisplayBox)box active:(BOOL)active {
    // TODO: implement.
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[self.class alloc] initWithDocument:self.document page:self.page range:self.range string:self.string];
}

#pragma mark - PSPDFKit

- (nullable instancetype)initWithDocument:(PDFXDocument *)document PSPDFSearchResult:(PSPDFSearchResult *)pspdfSearchResult {
    let index = pspdfSearchResult.pageIndex;
    let page = [document pageAtIndex:index];
    let range = pspdfSearchResult.range;

    // let textParser = [self.pspdfDocument textParserForPageAtIndex:pageIndex];
    // TODO: we'll set the preview text for quick test, it should actually
    // be the text at that range (which corresponds more or less to the
    // search string. Quick & dirty test, please fix.
    let string = pspdfSearchResult.previewText;

    if ((self = [self initWithDocument:document page:page range:range string:string])) {
        self.pspdfSearchResult = pspdfSearchResult;
    }

    return self;
}

#pragma mark - Private

- (instancetype)initWithDocument:(PDFXDocument *)document page:(nullable PDFXPage *)page range:(NSRange)range string:(nullable NSString *)string {
    if ((self = [super init])) {
        _document = document;
        _page = page;
        _range = range;
        _string = string;
    }
    return self;
}

@end
