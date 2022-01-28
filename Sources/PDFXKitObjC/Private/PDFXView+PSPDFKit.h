//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if !FRAMEWORK_BUILD
#import "PDFXView.h"
#import "PSPDFKit+PDFXKit.h"
#else
#import <PDFXKit/PDFXView.h>
#import <PDFXKit/PSPDFKit+PDFXKit.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PDFXView () <PSPDFViewControllerDelegate>

@property (nonatomic, readonly) PSPDFViewController *pspdfViewController;
@property (nonatomic, readonly) PSPDFDocument *pspdfDocument;

- (PSPDFViewController *)makePSPDFViewController;

- (void)pspdfViewControllerDidChangePageNotification:(NSNotification *)notification NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
