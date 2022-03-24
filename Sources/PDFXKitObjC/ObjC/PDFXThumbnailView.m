//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXThumbnailView+PSPDFKit.h"
#import "PDFXView+PSPDFKit.h"
#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

@implementation PDFXThumbnailView

NSNotificationName const PDFXThumbnailViewDocumentEditedNotification = @"PDFXThumbnailViewDocumentEditedNotification";

#pragma mark - Initializing a Thumbnail View

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self PDFXThumbnailViewLoad];
    }
    return self;
}

// @private common init method used for regular initialization and NSCoding.
- (void)PDFXThumbnailViewLoad {
    self.translatesAutoresizingMaskIntoConstraints = NO;

    _pspdfScrubberBar = [PSPDFScrubberBar new];
    _pspdfScrubberBar.translatesAutoresizingMaskIntoConstraints = NO;
    _pspdfScrubberBar.delegate = self;
    [self addSubview:_pspdfScrubberBar];

    [_pspdfScrubberBar.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_pspdfScrubberBar.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [_pspdfScrubberBar.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [_pspdfScrubberBar.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}

#pragma mark - Miscellaneous

- (void)setPDFView:(PDFXView *)PDFView {
    if (_PDFView != PDFView) {
        _PDFView = PDFView;
        self.pspdfScrubberBar.dataSource = PDFView.pspdfViewController;
    }
}

// @property (nonatomic) PDFXSize thumbnailSize PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
// @property (nonatomic, copy, nullable) PDFXColor *backgroundColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

// @property (nonatomic) PDFXThumbnailLayoutMode layoutMode PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
// @property (nonatomic) PDFXEdgeInsets contentInset PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

// @property (nonatomic, readonly, strong, nullable) NSArray<PDFXPage*> *selectedPages PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super initWithCoder:coder])) {
        [self PDFXThumbnailViewLoad];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
}

#pragma mark - PSPDFScrubberBarDelegate

- (void)scrubberBar:(PSPDFScrubberBar *)scrubberBar didSelectPageAtIndex:(NSUInteger)pageIndex {
    let document = self.PDFView.document;
    if (document == nil) { return; }

    let page = [self.PDFView.document pageAtIndex:pageIndex];
    if (page == nil) { return; }

    [self.PDFView goToPage:page];

    // HACK: the scrubber bar doesn't update itself which might be a bug as
    // described in issue #11842. Until this is resolved, we'll mark this as
    // workaround and update the page index manually.
    //
    // For more info, see issue #11842:
    // https://github.com/PSPDFKit/PSPDFKit/issues/11842
    [self.pspdfScrubberBar setPageIndex:pageIndex];
}

@end
