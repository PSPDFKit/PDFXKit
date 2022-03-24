//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXThumbnailView.h"
#import "PSPDFKit+PDFXKit.h"
#import "PDFXPlatform.h"

NS_ASSUME_NONNULL_BEGIN

@class PSPDFScrubberBar;

@interface PDFXThumbnailView () <PSPDFScrubberBarDelegate>

@property (nonatomic, strong) PSPDFScrubberBar *pspdfScrubberBar;

@end

NS_ASSUME_NONNULL_END
