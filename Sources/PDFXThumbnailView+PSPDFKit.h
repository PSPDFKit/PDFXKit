//
//  Copyright (c) 2017 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import <PDFXKit/PDFXThumbnailView.h>
#import <PDFXKit/PSPDFKit+PDFXKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PSPDFScrubberBar;

@interface PDFXThumbnailView () <PSPDFScrubberBarDelegate>

@property (nonatomic, strong) PSPDFScrubberBar *pspdfScrubberBar;

@end

NS_ASSUME_NONNULL_END
