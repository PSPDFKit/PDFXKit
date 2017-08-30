//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import "PDFXView.h"
#import "PSPDFKit+PDFXKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXView () <PSPDFViewControllerDelegate>

@property (nonatomic, readonly) PSPDFViewController *pspdfViewController;
@property (nonatomic, readonly) PSPDFDocument *pspdfDocument;

- (PSPDFViewController *)makePSPDFViewController;

- (void)pspdfViewControllerDidChangePageNotification:(NSNotification *)notification NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
