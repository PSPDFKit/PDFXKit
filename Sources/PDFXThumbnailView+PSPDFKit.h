//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXThumbnailView.h>
#import <PDFXKit/PSPDFKit+PDFXKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PSPDFScrubberBar;

@interface PDFXThumbnailView () <PSPDFScrubberBarDelegate>

@property (nonatomic, strong) PSPDFScrubberBar *pspdfScrubberBar;

@end

NS_ASSUME_NONNULL_END
